class Quality

  def initialize(quality)
    @quality = quality
  end

  def increase_quality(amount)
    @quality +=(amount)
  end

end
