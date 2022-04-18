# frozen_string_literal: true

require './file_manager'

class ConsolaManager
  attr_reader :fm, :commands, :finish

  def initialize
    @fm = FileManager.new
    @commands = {
      exit: method(:exit),
      ls: method(:ls),
      whereami: method(:whereami),
      create_folder: method(:create_folder),
      cd: method(:cd),
      destroy: method(:destroy),
      show: method(:show),
      metadata: method(:metadata),
      create_file: method(:create_file)
    }
    @finish = false
  end

  def exit
    @finish = true
  end

  def destroy(name)
    @fm.destroy(name)
  end

  def create_folder(name_folder)
    @fm.create_folder(name_folder)
  end

  def create_file(name_file, content)
    @fm.create_file(name_file, content)
  end

  def cd(name_folder='')
    @fm.cd(name_folder)
  end
  
  def show(name_file)
    @fm.show(name_file)
  end

  def metadata(name_file)
    @fm.metadata(name_file)
  end
  
  def whereami
    puts "\t#{@fm.whereami}\n"
  end

  def ls
    @fm.ls
    puts
  end

  def set_match(str)
    case str
    when /^([\w|-|_]+)\s([\w|-|_]+)\s(".*?")$/
      # <command> <arg> <arg>
      str.match(/^([\w|-|_]+)\s([\w|-|_]+)\s(".*?")$/)
    when /^([\w|-|_]+)\s([\w|-|_|..]+)$/
      # <command> <arg>
      str.match(/^([\w|-|_]+)\s([\w|-|_|..]+)$/)
    else
      # <command>
      str.match(/^([\w|-|_]+)$/)
    end
  end

  def run
    until @finish
      print " #{@fm.whereami}> "
      str = gets.chomp.to_s
      match = set_match(str)
      unless match
        puts "invalid command... \n" 
      else
        if @commands[match[1].to_sym]
          begin        
            @commands[match[1].to_sym].(*match[2..])
          rescue       
            puts $!
          end          
        else
          puts "invalid command... \n" 
        end
      end
    end
  end
end
