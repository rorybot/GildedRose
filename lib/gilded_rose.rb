  require_relative 'item'

class GildedRose
  attr_reader :special_items

  def initialize(items)
    @items = items
    @special_items = ['Backstage passes to a TAFKAL80ETC concert']
  end

  def update_quality
    @items.each do |item|
      item.quality.update unless special_items.include?(item.name)

      item.quality.flatline if item.sell_in.days_left <= 0 && item.name == 'Backstage passes to a TAFKAL80ETC concert'

      item.sell_in.modifier.times { item.quality.update } if item.name == 'Backstage passes to a TAFKAL80ETC concert'

      item.sell_in.update
    end
  end

end
