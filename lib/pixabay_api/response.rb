# frozen_string_literal: true

module PixabayApi
  class Response
    attr_accessor :status_code, :status, :body, :response

    def initialize(response)
      self.response = response
    end

    def success?
      response.code == 200
    end

    def failed?
      response.code.to_i != 200
    end

    def status_code
      self.status_code = response.code.to_i
    end

    def body
      self.body = JSON.parse(response.body)
    end
  end
end
