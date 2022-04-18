# frozen_string_literal: true

# require './consola'
require './consola_manager'

RSpec.describe ConsolaManager do
  before do
    @consola = ConsolaManager.new
  end

  describe '#set_match' do
    it 'matched a string' do
      expect(@consola.set_match('command')).to eq('command'.match(/^([\w|-|_]+)$/))
      expect(@consola.set_match('')).to eq(nil)
      expect(@consola.set_match('command arg_1'))
        .to eq('command arg_1'.match(/^([\w|-|_]+)\s([\w|-|_|..]+)$/))
      expect(@consola.set_match('create_folder +folder.')).to eq(nil)
      expect(@consola.set_match('command arg_1 "arg_2"'))
        .to eq('command arg_1 "arg_2"'.match(/^([\w|-|_]+)\s([\w|-|_]+)\s(".*?")$/))
      expect(@consola.set_match('create_file new_file content')).to eq(nil)
    end
  end
end
