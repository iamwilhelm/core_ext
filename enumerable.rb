module Enumerable
  
  # FIXME history is duplicated in Array's core extensions
  def to_histogram
    inject(Hash.new(0)) { |h, x| h[x] += 1; h }
  end

  # FIXME What the hell is this doing in Enumerables?
  def concurrently
    map{ |item| Thread.new{ yield item } }.each{ |t| t.join }
  end

  # Take each item and yield that item in a new sub process
  def forked
    map{ |item| Process.fork{ yield item } }
    Process.waitall
  end
  
end
