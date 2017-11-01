class ItemName
  attr_reader :name, :special_items
  def initialize(name)
    @name = name
  end

  def backstage_pass?
    name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def normal_modifier
    return 2 if name.include? 'Conjured'
    1
  end

  def to_s
    name.to_s
  end
end
