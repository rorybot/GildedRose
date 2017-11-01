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
end
