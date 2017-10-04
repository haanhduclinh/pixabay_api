# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PixabayApi::VideoApi do
  describe '#find' do
    it 'success when find video' do
      expect(@response.status_code).to eq(200)
    end

    before do
      stub_url = 'https://pixabay.com/api/videos/?key=xxxxxx-xxxxxxxxx&q=test'
      stub_request(:get, stub_url).to_return(
        status: 200
      )

      video_api = PixabayApi::VideoApi.new
      @response = video_api.find(keyword: 'test')
    end
  end
end
