# frozen_string_literal: true

require './file'

RSpec.describe File do
  before do
    @file = File.new('content', 'name', 'path')
  end
  describe '#new' do
    it 'creates File with meta' do
      expect(@file.content).to eq('content')
      expect(@file.meta[:name]).to eq('name')
      expect(@file.meta[:path]).to eq('path')
      expect(@file.meta[:size_content]).to eq('content'.bytesize)
    end
  end
end
