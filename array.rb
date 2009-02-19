class Array

  # TODO this already exists in the ruby library
  # FIXME deprecate this function and replace all uses of it
  def split_in(num_sections)
    return self if empty? 
    return [self] if num_sections == 1
    groups = []
    each_slice(((length+num_sections-1)/num_sections).floor) { |a| groups << a }
    groups
  end

  def normalize_to(upper)
    highest = self.max
    return self if highest == 0
    self.map! do |value|
      value = (upper*1.0*value/highest).round
    end
  end

  # TODO does this belong in enumerables?
  # TODO does this belong here at all??? How would you take the mean of an array of anything other than numbers (dates, tuples, etc.)?
  # where is sum()?
  def mean
    (size > 0) ? sum.to_f / size : 0
  end

  # gets a list of all the assets of the elements in the array.  
  # basically a map and flatten
  def expand
    self.map { |e| yield e }.flatten
  end

  # scan and sum up the frequencies of each token 
  # 
  #   a = [1,2,3,4,2,3,5,1,2,4,3].histogram # => {"1"=>2, "2"=>3, "3"=>3, "4"=>2, "5"=>1}
  #   a["2"] # => 3
  #   a["30"] # => 0
  #   
  # If a histogram is accessed with a value that doesn't exist, it returns a default value,
  # which can be set as an argument in the method
  def histogram(default_value = 0, &block)
    frequency_hash = Hash.new(default_value)
    self.each { |element| 
      key = block_given? ? block.call(element) : element
      frequency_hash[key] += 1 
    }
    return frequency_hash
  end

  # the ability to respond to what to do in case an array is empty.  This is useful
  # in being able to display a message if the array is empty.
  #
  #   <% @friends.each do |friend| -%>
  #     <li><%= h friend.username %></li>
  #   <% end.empty do -%>
  #     No friends yet
  #   <% end -%>
  def empty(message = "")
    if self.empty?
      return block_given? ? (yield message) : message
    end
  end


end
