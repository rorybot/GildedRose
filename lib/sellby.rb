class SellBy
  attr_reader :days_left, :special_object

  def initialize(days, special_object = false)
    @days_left = days
    @special_object = special_object
  end

  def update
    @days_left -= 1 if days_left > 0
  end

  def modifier
    return 1 if backstage_pass? && days_left >= 11
    return 2 if backstage_pass? && days_left < 11 && days_left >= 6
    return 3 if backstage_pass? && days_left < 6 && days_left > 0
  end

  def backstage_pass?
    special_object == 'Backstage passes to a TAFKAL80ETC concert'
  end


end
