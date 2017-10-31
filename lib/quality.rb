class Quality

  attr_reader :immortal
  def initialize(quality, immortal=false, grower=false)
    @quality = quality
    @immortal = immortal
    @grower = grower
    return @quality
  end


  def change_quality(amount)
    return @quality += amount unless immortal == true
    "That which is dead can never die"
  end
end
