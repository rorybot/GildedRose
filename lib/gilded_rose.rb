require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      remove_all_value_when_expired(item)
      update_quality_plus_modifier_check(item)
      one_day_less(item)
    end
  end

  private

  def normal_check_modifier(item)
    item.name.normal_modifier
  end

  def backstage_pass_modifier(item)
    item.sell_in.pass_modifier
  end

  def one_day_less(item)
    item.sell_in.update
  end

  def remove_all_value_when_expired(item)
    item.quality.flatline if item.sell_in.days_left <= 0 && item.name.backstage_pass?
  end

  def update_quality_plus_modifier_check(item)
    return normal_check_modifier(item).times { item.quality.update } unless item.name.backstage_pass?
    backstage_pass_modifier(item).times { item.quality.update }
  end
end
