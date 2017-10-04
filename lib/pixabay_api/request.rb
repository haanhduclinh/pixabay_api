# frozen_string_literal: true

require 'resolv-replace'

module PixabayApi
  class Request
    attr_accessor :query

    class << self
      def create(api_key:, params: {}, endpoint: 'xxx')
        build_query(api_key, params, endpoint)
        uri = URI(@query)

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new uri
          http.request(request)
        end
      end

      def build_query(api_key, params, endpoint)
        @query = "#{endpoint}?key=#{api_key}&#{params_to_s(params)}"
      end

      private

      def params_to_s(params)
        URI.encode_www_form(params)
      end
    end
  end
end
