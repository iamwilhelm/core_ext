class Object
  ##
  #   @person ? @person.name : nil
  # vs
  #   @person.try(:name)
  #
  #   @person.send(:name) if @person.respond_to?(:name)
  # vs
  #   @person.try(:name)
  def try(method)
    send method if respond_to? method
  end
end
