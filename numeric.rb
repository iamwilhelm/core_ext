class Numeric
  def with_separator( separator = ',', length = 3 )
    splitter = Regexp.compile "(\\d{#{length}})"
    before, after = self.to_s.split('.')
    before = before.reverse.gsub splitter, '\1' + separator
    str = "#{ before.chomp( separator ).reverse }"
    str += ".#{ after }" if after
    return str
  end

  def limit(min, max)
    return max if self > max
    return min if self < min
    return self
  end

end
