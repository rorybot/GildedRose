class Quality
  attr_reader :immutable, :grower, :quality
  MAX_QUALITY = 50
  def initialize(quality, immutable = false, grower = false)
    @quality = quality
    @immutable = immutable
    @grower = grower
    @quality
  end

  def update
    return change_quality(-1) unless grower == true
    change_quality(1)
  end

  def flatline
    @quality = 0
    @immutable = true
  end

  def to_s
    "#{@quality}"
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
