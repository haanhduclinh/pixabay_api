# frozen_string_literal: true
require 'cgi'
require_relative 'error'
require_relative 'response'
require_relative 'request'
require_relative 'configuration'
require 'pixabay_api'

module PixabayApi
  class ApiBase
    attr_accessor :params

    def initialize
      @api = PixabayApi.configuration.api_key
    end

    def find(keyword:, options: {})
      self.params = { q: keyword }.merge(options)
      response_raw = PixabayApi::Request.create(
        api_key: @api,
        params: params,
        endpoint: endpoint
      )
      response = PixabayApi::Response.new(response_raw)

      if response.failed?
        raise PixabayApi::Error::RequestError.new(response.body)
      end

      response
    end

    def find_and_return_array(keyword:, options: {})
      response = find(keyword: keyword, options: options)

      return [] if response.body['totalHits'].to_i.zero?
      response.body['hits']
    end

    private

    def endpoint
      'https://pixabay.com/api/'
    end
  end
end
