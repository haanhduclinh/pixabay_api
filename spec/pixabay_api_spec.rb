# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PixabayApi::Configuration do
  describe 'configure' do
    it 'include api key' do
      expect(PixabayApi.configuration.api_key).to eq('xxxxxx-xxxxxxxxx')
    end

    it 'exist version in lib' do
      expect(PixabayApi::VERSION.split('.').any? { |x| x.to_i > 0 }).to be true
    end
  end
end
