# frozen_string_literal: true

class File
  attr_reader :content, :meta

  def initialize(content, name, path)
    @content = content
    @meta = {
      create_at: Time.new.inspect.to_s,
      name: name,
      path: path,
      size_content: @content.bytesize
    }
  end
end
