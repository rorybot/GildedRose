class Quality

  attr_reader :immortal, :grower
  def initialize(quality, immortal=false, grower=false)
    @quality = quality
    @immortal = immortal
    @grower = grower
    return @quality
  end

  def update
    return change_quality(-1) unless grower == true
    change_quality(1)
  end

  def change_quality(amount)
    return @quality += amount unless immortal == true
    "That which is dead can never die"
  end
end
