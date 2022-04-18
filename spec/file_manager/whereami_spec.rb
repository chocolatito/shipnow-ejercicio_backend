# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#whereami' do
    it 'get path for the root' do
      @whereami = @fm.whereami
      expect(@whereami).to eq('/')
    end
    it 'get the hash for the new folder' do
      @fm.create_folder('new_folder')
      @fm.cd('new_folder')
      @whereami = @fm.whereami
      expect(@whereami).to eq('/new_folder')
    end
  end
end
