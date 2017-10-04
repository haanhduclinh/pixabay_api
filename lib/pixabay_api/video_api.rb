# frozen_string_literal: true

module PixabayApi
  class VideoApi < ApiBase
    private

    def endpoint
      'https://pixabay.com/api/videos/'
    end
  end
end
