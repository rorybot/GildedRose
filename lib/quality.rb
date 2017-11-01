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
    update(-value)
    @grower = false
  end

  def to_s
    @value.to_s
  end

  private

  def change_value(amount)
    return @value += amount unless immutable == true || over_limit?(amount) || would_go_neg?(amount)
    'No can do'
  end

  def would_go_neg?(amount)
    value + amount < 0
  end

  def over_limit?(amount)
    value + amount > MAX_QUALITY
  end
end
