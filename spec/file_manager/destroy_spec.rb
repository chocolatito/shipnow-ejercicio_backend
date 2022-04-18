# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#destroy' do
    it 'a folder' do
      @fm.create_folder('new_folder')
      @fm.destroy('new_folder')
      expect(@fm.folders).to eq({ :/ => [{}, {}] })
    end
    it 'a file' do
      @fm.create_file('new_file', 'content')
      @fm.destroy('new_file')
      expect(@fm.folders).to eq({ :/ => [{}, {}] })
    end
  end
end
