class SellBy
  attr_reader :days_left

  def initialize(days)
    @days_left = days
  end

  def update
    @days_left -= 1
  end

  def to_s
    "#{@days_left}"
  end

  def pass_modifier
    return 1 if days_left >= 11 #returns how many times to modify depending on date range
    return 2 if days_left.between?(6,10)  #returns how many times to modify depending on date range
    return 3 if days_left.between?(0,5)  #returns how many times to modify depending on date range
  end

end
