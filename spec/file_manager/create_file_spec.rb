# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#create_file' do
    it 'creates a new file in root' do
      @fm.create_file('new_file', 'content for new_file')
      @file = @fm.folders[:/][1][:new_file]
      expect(@file.class).to eq(File)
    end
    it 'creates inside an existing folder' do
      @fm.create_folder('existing_folder')
      @fm.cd('existing_folder')
      @fm.create_file('new_file', 'content for new_file')
      @file = @fm.folders[:/][0][:existing_folder][1][:new_file]
      expect(@file.class).to eq(File)
    end
  end
end
