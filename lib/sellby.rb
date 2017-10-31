class SellBy
  attr_reader :expires

  def initialize(expires)
    @expires = Time.parse(expires)
  end

  def days_left(current_date)
    distance_in_seconds = expires - Time.parse(current_date)
    distance_in_seconds/60/60/24
  end
end
