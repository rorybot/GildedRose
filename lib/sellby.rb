class SellBy
  attr_reader :days_left, :special_object

  def initialize(days, special_object = false)
    @days_left = days
    @special_object = special_object
  end

  def update
    @days_left -= 1 if days_left > 0
  end


end
