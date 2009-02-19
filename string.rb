class String
  # changes a string to be the fit for a yaml name
  def sanitize_for_yaml_key
    self.gsub(/[^a-zA-Z0-9 ]/, '').gsub(' ','_').downcase
  end

  # takes the spaces out of a string and replaces them with underscores, and
  # downcases the string.
  def underscorize
    self.downcase.gsub(/\s+/, '_')
  end

  # undos underscorize
  def normalize
    self.split(/_+/).map(&:capitalize).join(' ')
  end
end
