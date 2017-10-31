class Quality
  attr_reader :immortal, :grower, :quality
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

  private

  def change_quality(amount)
    return @quality += amount unless immortal == true || quality == 50 || quality == 0
    'No can do'
  end
end
