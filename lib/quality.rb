class Quality

  def initialize(quality)
    @quality = quality
    return @quality
  end

  def change_quality(amount)
    @quality +=(amount)
  end

end
