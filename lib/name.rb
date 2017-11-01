class ItemName
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def backstage_pass?
    name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def to_s
    name.to_s
  end
end
