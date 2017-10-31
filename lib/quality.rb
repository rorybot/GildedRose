class Quality

  def initialize(quality, immortal = false)
    @quality = quality
    @immortal = immortal
    return @quality
  end

  def change_quality(amount)
    return @quality +=(amount) unless @immortal == true
  end

end
