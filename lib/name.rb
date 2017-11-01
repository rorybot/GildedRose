class ItemName
  attr_reader :name, :special_items
  def initialize(name)
    @name = name
    @special_items = ['Backstage passes to a TAFKAL80ETC concert']
  end

  def backstage_pass?
    name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def special_item?
    special_items.include?(name)
  end

  def to_s
    name.to_s
  end
end
