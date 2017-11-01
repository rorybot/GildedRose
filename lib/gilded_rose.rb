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

      pass_modifier(item.sell_in).times { item.quality.update } if item.name == 'Backstage passes to a TAFKAL80ETC concert'

      item.sell_in.update
    end
  end

  def pass_modifier(sell_by_date)
    return 1 if sell_by_date.days_left >= 11 || sell_by_date.days_left < 0
    return 2 if sell_by_date.days_left < 11 && sell_by_date.days_left >= 6
    return 3 if sell_by_date.days_left < 6 && sell_by_date.days_left >= 0
  end


end
