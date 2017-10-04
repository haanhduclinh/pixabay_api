# frozen_string_literal: true

require 'resolv-replace'
require 'cgi'

module PixabayApi
  class Request
    class << self
      def create(api_key:, params: {}, endpoint: 'xxx')
        query = build_query(api_key, params, endpoint)
        uri = URI(query)

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new uri
          http.request(request)
        end
      end

      private

      def build_query(api_key, params, endpoint)
        "#{endpoint}?key=#{api_key}&#{params_to_s(params)}"
      end

      def params_to_s(params)
        CGI.escape(params.map { |k, v| "#{k}=#{v}" }.join('&'))
      end
    end
  end
end
