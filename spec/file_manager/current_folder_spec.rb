# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#current_folder' do
    it 'get the hash for the root' do
      @fm.create_folder('folder_1')
      @fm.create_folder('folder_2')
      @current = @fm.send(:current_folder, @fm.am_i, @fm.folders)
      expect(@current).to eq([
                               {
                                 folder_1: [{}, {}],
                                 folder_2: [{}, {}]
                               },
                               {}
                             ])
    end
    it 'get the hash for the new folder' do
      @fm.create_folder('new_folder')
      @fm.cd('new_folder')
      @current = @fm.send(:current_folder, @fm.am_i, @fm.folders)
      expect(@current).to eq([{}, {}])
    end
  end
end
