class Quality
  attr_reader :immutable, :grower, :value
  MAX_QUALITY = 50
  def initialize(value, immutable = false, grower = false)
    @value = value
    @immutable = immutable
    @grower = grower
  end

  def update(value = 1)
    return change_value(-value) unless grower == true
    change_value(value)
  end

  def flatline
    change_value(-value)
    @grower = false
  end

  def to_s
    @value.to_s
  end

  private

  def change_value(amount, override = false)
    return @value += amount unless immutable || outside_bounds?(amount)
    'No can do'
  end

  def outside_bounds?(amount)
    # value + amount > MAX_QUALITY || value + amount < 0
    (value + amount).between?(0,MAX_QUALITY) == false
  end
end
