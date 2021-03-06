class SellBy
  attr_reader :days_left

  def initialize(days)
    @days_left = days
  end

  def update
    @days_left -= 1
  end

  def to_s
    @days_left.to_s
  end

  def pass_modifier
    return 1 if days_left >= 11
    return 2 if days_left.between?(6, 10)
    return 3 if days_left.between?(0, 5)
  end
end
