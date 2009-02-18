class Time
  alias :before? :<
  alias :after? :>

  def beginning_of_hour
    Time.parse(strftime("%D %H:00:00"))
  end
  alias at_beginning_of_hour beginning_of_hour

  def end_of_hour
    Time.parse(strftime("%D %H:59:59"))
  end
  alias at_end_of_hour end_of_hour

  # formats as date with dashes
  #
  #   2008-05-06
  # 
  # NOTE this is usually used for the url in mastermind
  def as_date
    strftime "%Y-%m-%d"
  end

  # formats as date with dashes and a 24 hour clock
  #
  #   2008-05-06 14:23
  #
  def as_datetime
    strftime "%Y-%m-%d %H:%M"
  end

  # format as date with readable time
  #
  #   May 06 6:34 pm
  #
  # NOTE this is usually used for display purposes
  def as_datetime_in_words
    strftime "%b %d %I:%M %p"
  end

  # format as date
  def as_date_in_words
    strftime "%b %d %Y"
  end
 
  # formats as displayable date
  #
  #   Sept 1st, 2008
  #
  def as_readable_date
    strftime "%b %e, %Y"
  end

  # compares this date with another date by comparing their string 
  # representations.  
  def same_date_as(other)
    self.as_date == other.as_date
  end
end
