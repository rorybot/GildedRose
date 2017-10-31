require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.quality.update if item.name != 'Backstage passes to a TAFKAL80ETC concert'

      1.times{item.quality.update} if item.sell_in.days_left >= 11 && item.name == 'Backstage passes to a TAFKAL80ETC concert'

      2.times{item.quality.update} if item.sell_in.days_left < 11 && item.sell_in.days_left >=6 && item.name == 'Backstage passes to a TAFKAL80ETC concert'  #increase it by 2 when 10 days are lef

      3.times{item.quality.update} if item.sell_in.days_left < 6 && item.name == 'Backstage passes to a TAFKAL80ETC concert'


      item.sell_in.update
    end
  end
end
