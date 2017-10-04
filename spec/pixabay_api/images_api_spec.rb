# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PixabayApi::ImagesApi do
  include_context 'shared api'

  describe '#find' do
    it 'include image_type is photo' do
      expect(@api.params[:image_type]).to eq('photo')
    end
  end

  describe '#find_and_return_array' do
    it 'returns array data' do
      expect(@api.find_and_return_array(keyword: 'test')).to be_kind_of(Array)
      expect(@api.find_and_return_array(keyword: 'test').size).to be(1)
    end
  end
end
