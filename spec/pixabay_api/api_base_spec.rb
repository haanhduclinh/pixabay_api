# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PixabayApi::ApiBase do
  describe '#find' do
    context 'when valid request' do
      let(:return_request) do
        {
          'totalHits' => 500,
          'hits' =>
            [
              {
                'previewHeight' => 84,
                'likes' => 23,
                'favorites' => 6,
                'tags' => 'bread, ham, tight max',
                'webformatHeight' => 360,
                'views' => 772,
                'webformatWidth' => 640,
                'previewWidth' => 150,
                'comments' => 24,
                'downloads' => 494,
                'pageURL' => 'https://pixabay.com/en/bread-ham-tight-max-egg-fried-2796393/',
                'previewURL' => 'https://cdn.pixabay.com/photo/2017/09/28/18/13/bread-2796393_150.jpg',
                'webformatURL' => 'https://pixabay.com/get/eb32b8092bfd023ed95c4518b7484595ea7fe3d204b0144192f0c879a2efb1_640.jpg',
                'imageWidth' => 5472,
                'user_id' => 19_628,
                'user' => 'RitaE',
                'type' => 'photo',
                'id' => 2_796_393,
                'userImageURL' => 'https://cdn.pixabay.com/user/2017/06/28/22-56-11-59_250x250.jpg',
                'imageHeight' => 3_080
              }
            ]
        }.to_json
      end

      it 'returns success status' do
        expect(@response).to be_kind_of(PixabayApi::Response)
        expect(@response.status_code).to be(200)
      end

      before do
        stub_url = 'https://pixabay.com/api/?q=test&key=xxxxxx-xxxxxxxxx'
        stub_request(:get, stub_url).to_return(
          body: return_request,
          status: 200
        )

        pixa_api = PixabayApi::ApiBase.new
        @response = pixa_api.find(keyword: 'test')
      end
    end

    context 'when invalid request' do
      let(:return_request) do
        { body: '[ERROR 400] Invalid or missing API key (https://pixabay.com/api/docs/).' }.to_json
      end

      it 'raise error' do
        expect do
          pixa_api = PixabayApi::ApiBase.new
          pixa_api.find(keyword: 'test')
        end.to raise_error(PixabayApi::Error::RequestError)
      end

      before do
        PixabayApi.configure do |c|
          c.api_key = 'wrong_api'
        end

        stub_url = 'https://pixabay.com/api/?q=test&key=wrong_api'
        stub_request(:get, stub_url).to_return(
          body: return_request,
          status: 400
        )
      end
    end
  end
end
