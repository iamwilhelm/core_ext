class Float
  alias_method :old_round, :round unless method_defined?(:old_round)
  def round( n=1 ) #n=1
      return self if n == 0
      rounded = (self * (1.0 / n)).old_round.to_f / (1.0 / n)
      return rounded.to_i if n==1
      return rounded
  end
end
