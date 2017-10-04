# frozen_string_literal: true

module PixabayApi
  class ImagesApi < ApiBase
    def find(keyword:, options: { image_type: 'photo' })
      super
    end

    def find_and_return_array(keyword:, options: { image_type: 'photo' })
      super
    end
  end
end
