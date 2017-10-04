# frozen_string_literal: true

require 'resolv-replace'
require 'net/http'
require 'uri'
require 'cgi'
require 'json'

require 'pixabay_api/configuration'
require 'pixabay_api/error'
require 'pixabay_api/api_base'
require 'pixabay_api/images_api'
require 'pixabay_api/video_api'

module PixabayApi
  class << self
    attr_writer :configuration

    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
