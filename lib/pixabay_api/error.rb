# frozen_string_literal: true
require 'logger'

module PixabayApi
  module Error
    class PixabayError < StandardError
    end

    # RequestError is raised when request to Pixabay server is invalid
    class RequestError < PixabayError
    end

    # RequestError is raised when request to Pixabay server is timeout
    class RequestTimeOut < PixabayError
    end

    # RequestError is raised when request is failed due to NG data
    class NgError < PixabayError
    end

    # RequestError is raised when request is failed due to Pixabay system error
    class SystemError < PixabayError
    end
  end
end
