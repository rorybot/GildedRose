require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      remove_all_value_when_expired(item)

      item.name.normal_modifier.times { normal_update(item) }

      item.sell_in.pass_modifier.times { item.quality.update } if item.name.backstage_pass?

      one_day_less(item)
    end
  end

  private

  def normal_update(item)
    item.quality.update unless item.name.backstage_pass?
  end

  def one_day_less(item)
    item.sell_in.update
  end

  def remove_all_value_when_expired(item)
    item.quality.flatline if item.sell_in.days_left <= 0
  end

  # def normal_modifier(name)
  #   return 2 if name.to_s.include? 'Conjured'
  #   1
  # end

end
