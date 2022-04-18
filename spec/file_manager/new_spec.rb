# frozen_string_literal: true

require './file_manager'

RSpec.describe FileManager do
  before do
    @fm = FileManager.new
  end
  describe '#new' do
    it 'creates a FileManager object' do
      expect(@fm.folders).to eq({ :/ => [{}, {}] })
      expect(@fm.am_i).to eq([:/])
    end
  end
end
