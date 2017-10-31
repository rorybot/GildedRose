require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.quality.update if item.name != 'Backstage passes to a TAFKAL80ETC concert'

      item.quality.flatline if item.sell_in.days_left == 0 && item.name == 'Backstage passes to a TAFKAL80ETC concert'

      item.sell_in.modifier.times { item.quality.update } if item.name == 'Backstage passes to a TAFKAL80ETC concert'

      item.sell_in.update
    end
  end
end
