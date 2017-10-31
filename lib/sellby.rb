class SellBy
  attr_reader :days_left

  def initialize(days)
    @days_left = days
  end

  def update
    @days_left -= 1
  end

  def modifier
    return 1 if days_left >= 11 || days_left < 0
    return 2 if days_left < 11 && days_left >= 6
    return 3 if days_left < 6 && days_left >= 0
  end

  def to_s
    "#{@days_left}"
  end
end
