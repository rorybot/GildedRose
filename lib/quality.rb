class Quality
  attr_reader :immortal, :grower, :quality
  MAX_QUALITY = 50
  def initialize(quality, immortal = false, grower = false)
    @quality = quality
    @immortal = immortal
    @grower = grower
    @quality
  end

  def update
    return change_quality(-1) unless grower == true
    change_quality(1)
  end

  def flatline
    @quality = 0
    @grower = false
  end

  private

  def change_quality(amount)
    return @quality += amount unless immortal == true || over_limit?(amount) || would_go_neg?(amount)
    'No can do'
  end

  def would_go_neg?(amount)
    quality + amount < 0
  end

  def over_limit?(amount)
    quality + amount > MAX_QUALITY
  end
end
