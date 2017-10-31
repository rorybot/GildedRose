require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      item.quality.update

      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality.update if item.sell_in.days_left < 11
          item.quality.update if item.sell_in.days_left < 6
      end

    item.sell_in.update

    end
  end
end
