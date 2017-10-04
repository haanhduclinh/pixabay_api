require 'pixabay_api'

PixabayApi.configure do |c|
  c.api_key = 'xxxx'
end

images_api = PixabayApi::ImagesApi.new
response = images_api.find(keyword: 'test')

p response.status
p response.body

pictures = images_api.find_and_return_array(keyword: 'test')
p pictures.size