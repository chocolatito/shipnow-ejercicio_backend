require './file'

class FileManager
  attr_reader :folders, :am_i

  def initialize
    @folders = { :/ => [{}, {}] }
    @am_i = [:/]
  end
  
  def cd(name_folder='')
    if name_folder.empty?
      @am_i = [:/]
    elsif name_folder == '..'
      @am_i.pop() unless @am_i.count == 1
    elsif current_folder(@am_i, @folders)[0][name_folder.to_sym]
      @am_i << name_folder.to_sym
    else
      puts "\t¡¡¡ERROR!!!"
      puts "\tNo existe la carpeta '#{name_folder}' en esta carpeta"
    end
  end
  
  def create_folder(name_folder)
    current = current_folder(@am_i, @folders)
    unless current[0][name_folder.to_sym]
      current[0][name_folder.to_sym] = [{}, {}]
    else
      puts "YA EXISTE LA CARPETA #{name_folder}"
    end
  end
  
  def create_file(name_file, content)
    current = current_folder(@am_i, @folders)
    unless current[1][name_file.to_sym]
      current[1][name_file.to_sym] = File.new(content, name_file, whereami)
    else
      puts "\t¡¡¡ERROR!!!"
      puts "\tYa existe el archivo '#{name_file}' en esta carpeta"
    end
  end

  def destroy(name)
    current = current_folder(@am_i, @folders)
    if current[0][name.to_sym]
      current[0].delete(name.to_sym)
    elsif current[1][name.to_sym]
      current[1].delete(name.to_sym)
    else
      puts "\t¡¡¡ERROR!!!"
      puts "\tNo existe la carpeta o el archivo '#{name_file}' en esta carpeta"
    end
  end
    
  def ls
    current_folder(@am_i, @folders)[0].each_key do |k|
      puts "\t./#{k}/"
    end
    
    current_folder(@am_i, @folders)[1].each_key do |k|
      puts "\t./#{k}"
    end
  end
  
  def show(name_file)
    current = current_folder(@am_i, @folders)
    if current[1][name_file.to_sym]
      puts current[1][name_file.to_sym].content
    else
      puts "\t¡¡¡ERROR!!!"
      puts "\tNo existe el archivo '#{name_file}' en esta carpeta"
    end
  end

  def whereami
    @am_i[0].to_s + @am_i[1..].join('/')
  end

  def metadata(name_file)
    current = current_folder(@am_i, @folders)
    if current[1][name_file.to_sym]
      meta = current[1][name_file.to_sym].meta
      puts "\tcreate_at: #{meta[:create_at]}"
      puts "\tname: #{meta[:name]}"
      puts "\tpath: #{meta[:path]}"
      puts "\tsize_content: #{meta[:size_content]}"
      puts
    else
      puts "\t¡¡¡ERROR!!!"
      puts "\tNo existe el archivo '#{name_file}' en esta carpeta"
    end
  end

  private

  def current_folder(am_i, sub)
    if am_i.count == 1
      return sub[am_i[0]]
    else
      new_sub = sub[am_i[0]][0]
      new_am_i = am_i[1..]
      return current_folder(new_am_i, new_sub)
    end
  end
end


