class SellBy
  attr_reader :days_left, :special_object

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
end
