# frozen_string_literal: true

RSpec.shared_context 'shared api', shared_context: :metadata do
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

  before do
    stub_url = 'https://pixabay.com/api/?key=xxxxxx-xxxxxxxxx&q=test%26image_type=photo'
    stub_request(:get, stub_url).to_return(
      body: return_request,
      status: 200
    )

    @api = PixabayApi::ImagesApi.new
    @api.find(keyword: 'test')
  end
end
