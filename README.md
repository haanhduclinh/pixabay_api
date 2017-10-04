# Pixabay_api
[![Gem Version](https://badge.fury.io/rb/pixabay_api.svg)](https://badge.fury.io/rb/pixabay_api) [![Code Climate](https://codeclimate.com/github/haanhduclinh/s3-to-ftp.png)](https://codeclimate.com/github/haanhduclinh/s3-to-ftp) [![CI](https://travis-ci.org/haanhduclinh/pixabay_api.svg?branch=master)](https://travis-ci.org/haanhduclinh/pixabay_api) [![Coverage Status](https://coveralls.io/repos/github/haanhduclinh/pixabay_api/badge.svg?branch=master)](https://coveralls.io/github/haanhduclinh/pixabay_api?branch=master)

# Background
- Use PixaBayApi to get image data from pixabay.com follow API - https://pixabay.com/api/docs/. 
- Sign up to get free API - https://pixabay.com/en/accounts/register/

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'pixabay_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pixabay_api

## Configuring PixabayApi

If you're using Rails, create an initializer for this:

```
config/initializers/pixabay_api.rb
```

You can configure as below:

```
  PixabayApi.configure do |c|
    c.api_key = YOUR_API_KEY
  end
```

# Usage

## Get pictures data

```ruby
  images_api = PixabayApi::ImagesApi.new
  pictures = images_api.find(keyword: 'test')

  p pictures.success?
  p pictures.body['totalHits']
  p pictures.body
```

samples return

```
# true
# 500
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
}
```

## Get picture array data

```ruby
  images_api = PixabayApi::ImagesApi.new
  pictures = images_api.find_and_return_array(keyword: 'test')

  p pictures.success?
  p pictures.body['totalHits']
  p pictures.body
```

It will be return picture array


```
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
  },
  ...
]

```

## Get pictures data with options
- we can use options like below

```ruby
  images_api = PixabayApi::ImagesApi.new
  options = { category:  'animals', lang: 'vi' }
  picture = images_api.find(keyword: 'test', options: options)
  # or
  pictures = images_api.find_and_return_array(keyword: 'test', options: options)
```

- There are several options for video and image. You can check:

images: https://github.com/haanhduclinh/pixabay_api#search-images

videos: https://github.com/haanhduclinh/pixabay_api#search-videos

## Get video data and return array_data


```ruby
  video_api = PixabayApi::VideoApi.new
  videos = video_api.find(keyword: 'test')

  p pictures.success?
  p pictures.body['totalHits']
  p pictures.body
```

## Options

### Search Images

|fields|type|describle
|---|---|---|
|key (required)|str|Your API key|
|q|str|A URL encoded search term. If omitted, all images are returned. This value may not exceed 100 characters. Example: "yellow+flower"|
|lang|str|Language code of the language to be searched in. Accepted values: cs, da, de, en, es, fr, id, it, hu, nl, no, pl, pt, ro, sk, fi, sv, tr, vi, th, bg, ru, el, ja, ko, zh Default: "en"|
|id|str|ID, hash ID, or a comma separated list of values for retrieving specific images. In a comma separated list, IDs and hash IDs cannot be used together.|
|response_group|str|Choose between retrieving high resolution images and image details. When selecting details, you can access images up to a dimension of 960 x 720 px. Accepted values: "image_details", "high_resolution" (requires permission) Default: "image_details"|
|image_type|str|Filter results by image type. Accepted values: "all", "photo", "illustration", "vector" Default: "all"|
|orientation|str|Whether an image is wider than it is tall, or taller than it is wide. Accepted values: "all", "horizontal", "vertical" Default: "all"|
|category|str|Filter results by category. Accepted values: fashion, nature, backgrounds, science, education, people, feelings, religion, health, places, animals, industry, food, computer, sports, transportation, travel, buildings, business, music|
|min_width|int|Minimum image width. Default: "0"|
|min_height|int|Minimum image height. Default: "0"|
|editors_choice|bool|Select images that have received an Editor's Choice award. Accepted values: "true", "false" Default: "false"|
|safesearch| bool| A flag indicating that only images suitable for all ages should be returned. Accepted values: "true", "false" Default: "false"|
|order| str|  How the results should be ordered. Accepted values: "popular", "latest" Default: "popular"|
|page| int|  Returned search results are paginated. Use this parameter to select the page number. Default: 1|
|per_page| int|  Determine the number of results per page. Accepted values: 3 - 200 Default: 20|
|callback| str|  JSONP callback function name|
|pretty| bool|  Indent JSON output. This option should not be used in production. Accepted values: "true", "false" Default: "false"|

### Search Videos

|fields|type|describle
|---|---|---|
|key (required)|str|Your API key|
|q|str|A URL encoded search term. If omitted, all images are returned. This value may not exceed 100 characters. Example: "yellow+flower"|
|lang|str|Language code of the language to be searched in. Accepted values: cs, da, de, en, es, fr, id, it, hu, nl, no, pl, pt, ro, sk, fi, sv, tr, vi, th, bg, ru, el, ja, ko, zh Default: "en"|
|id|str|ID, hash ID, or a comma separated list of values for retrieving specific images. In a comma separated list, IDs and hash IDs cannot be used together.|
|response_group|str|Choose between retrieving high resolution images and image details. When selecting details, you can access images up to a dimension of 960 x 720 px. Accepted values: "image_details", "high_resolution" (requires permission) Default: "image_details"|
|video_type|str|Filter results by video type. Accepted values: "all", "film", "animation" Default: "all"|
|orientation|str|Whether an image is wider than it is tall, or taller than it is wide. Accepted values: "all", "horizontal", "vertical" Default: "all"|
|category|str|Filter results by category. Accepted values: fashion, nature, backgrounds, science, education, people, feelings, religion, health, places, animals, industry, food, computer, sports, transportation, travel, buildings, business, music|
|min_width|int|Minimum image width. Default: "0"|
|min_height|int|Minimum image height. Default: "0"|
|editors_choice|bool|Select images that have received an Editor's Choice award. Accepted values: "true", "false" Default: "false"|
|safesearch| bool| A flag indicating that only images suitable for all ages should be returned. Accepted values: "true", "false" Default: "false"|
|order| str|  How the results should be ordered. Accepted values: "popular", "latest" Default: "popular"|
|page| int|  Returned search results are paginated. Use this parameter to select the page number. Default: 1|
|per_page| int|  Determine the number of results per page. Accepted values: 3 - 200 Default: 20|
|callback| str|  JSONP callback function name|
|pretty| bool|  Indent JSON output. This option should not be used in production. Accepted values: "true", "false" Default: "false"|


- Get more detail - https://pixabay.com/api/docs/

# Rate Limit

By default, you can make up to 5,000 requests per hour. Requests are associated with the API key, and not with your IP address. The response headers tell you everything you need to know about your current rate limit status:


|Header name|Description|
|---|---|
|X-RateLimit-Limit|The maximum number of requests that the consumer is permitted to make in 30 minutes.|
|X-RateLimit-Remaining|The number of requests remaining in the current rate limit window.|
|X-RateLimit-Reset|The remaining time in seconds after which the current rate limit window resets.|

To keep the Pixabay API fast for everyone, requests must be cached for 24 hours. Also, the API is made for real human requests; do not send lots of automated queries. Systematic mass downloads are not allowed. If needed, we can increase this limit at any time - given that you've implemented the API properly.

# How to contributor
- Folk project
- Create pull request. Please remember add `rspec` and make sure pass all of test.

# Run test
- `bundle exec rspec`


# Author

haanhduclinh@yahoo.com | www.haanhduclinh.com