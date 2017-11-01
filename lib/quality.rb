class Quality
  attr_reader :immutable, :grower, :quality
  MAX_QUALITY = 50
  def initialize(quality, immutable = false, grower = false)
    @quality = quality
    @immutable = immutable
    @grower = grower
  end

  def update(value = 1)
    return change_quality(-value) unless grower == true
    change_quality(value)
  end

  def flatline
    update(-quality)
    @grower = false
  end

  def to_s
    @quality.to_s
  end

  private

  def change_quality(amount)
    return @quality += amount unless immutable == true || over_limit?(amount) || would_go_neg?(amount)
    'No can do'
  end

  def would_go_neg?(amount)
    quality + amount < 0
  end

  def over_limit?(amount)
    quality + amount > MAX_QUALITY
  end
end
