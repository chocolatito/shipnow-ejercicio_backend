# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  
  describe '#create_folder' do
    it 'creates a new folder in root' do
      @fm.create_folder('new_folder')
      expect(@fm.folders[:/][0]).to eq({ new_folder: [{}, {}] })
    end
    it 'creates inside an existing folder' do
      @fm.create_folder('existing_folder')
      @fm.cd('existing_folder')
      @fm.create_folder('new_folder')
      expect(@fm.folders[:/][0][:existing_folder]).to eq(
        [
          { new_folder: [{}, {}] },
          {}
        ]
      )
    end
  end
end
