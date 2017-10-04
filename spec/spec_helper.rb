# frozen_string_literal: true

require './lib/pixabay_api.rb'
require 'pry'
require 'webmock/rspec'
require './spec/supports/shared_api.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include_context 'shared api', include_shared: true

  config.before(:each) do
    PixabayApi.configure do |c|
      c.api_key = 'xxxxxx-xxxxxxxxx'
    end
  end

  WebMock.disable_net_connect!(allow_localhost: true)
end
