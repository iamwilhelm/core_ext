class File
  
  class << self
    def load_file(filename)
      string = ""
      File.open(filename) do |f|
        f.each_line { |line| string += line }
      end
      return string
    end
  end

end
