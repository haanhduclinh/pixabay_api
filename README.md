# Pixabay_api

# Background
- Use PixaBayApi to get free image from pixabay.com follow - https://pixabay.com/api/docs/

# Rate Limit

By default, you can make up to 5,000 requests per hour. Requests are associated with the API key, and not with your IP address. The response headers tell you everything you need to know about your current rate limit status:


|Header name|Description|
|---|---|
|X-RateLimit-Limit|The maximum number of requests that the consumer is permitted to make in 30 minutes.|
|X-RateLimit-Remaining|The number of requests remaining in the current rate limit window.|
|X-RateLimit-Reset|The remaining time in seconds after which the current rate limit window resets.|

To keep the Pixabay API fast for everyone, requests must be cached for 24 hours. Also, the API is made for real human requests; do not send lots of automated queries. Systematic mass downloads are not allowed. If needed, we can increase this limit at any time - given that you've implemented the API properly.

# How to use
- `gem install pixabay_api`


# How to contributor
- Folk project
- Create pull request. Please remember add `rspec` and make sure pass all of test.

# How to test this project on local environment
- `bundle exec rspec`


# Author

haanhduclinh@yahoo.com | www.haanhduclinh.com