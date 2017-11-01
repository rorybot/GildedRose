require_relative 'item'

class GildedRose
  attr_reader :special_items

  def initialize(items)
    @items = items
    @special_items = ['Backstage passes to a TAFKAL80ETC concert']
  end

  def update_quality
    @items.each do |item|
      normal_update(item)

      remove_all_value_when_expired(item)

      pass_modifier(item.sell_in).times { item.quality.update } if item.name == 'Backstage passes to a TAFKAL80ETC concert'

      one_day_less(item)
    end
  end

  private

  def normal_update(item)
    item.quality.update unless special_items.include?(item.name)
  end

  def one_day_less(item)
    item.sell_in.update
  end

  def remove_all_value_when_expired(item)
    item.quality.flatline if item.sell_in.days_left <= 0
  end

  def pass_modifier(sell_by_date)
    return 1 if sell_by_date.days_left >= 11 || sell_by_date.days_left < 0
    return 2 if sell_by_date.days_left < 11 && sell_by_date.days_left >= 6
    return 3 if sell_by_date.days_left < 6 && sell_by_date.days_left >= 0
  end
  end
