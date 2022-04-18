# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#cd' do
    it 'enter in new folder' do
      @fm.create_folder('new_folder')
      @fm.cd('new_folder')
      expect(@fm.whereami).to eq('/new_folder')
      expect(@fm.am_i).to eq(%i[/ new_folder])
    end
    it 'go back one folder' do
      @fm.create_folder('new_folder')
      @fm.cd('new_folder')
      @fm.cd('..')
      expect(@fm.whereami).to eq('/')
      expect(@fm.am_i).to eq(%i[/])
    end
  end
end
