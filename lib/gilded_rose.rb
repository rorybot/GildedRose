require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality # Updates the quality of each item
    @items.each do |item|
      remove_all_value_when_expired(item) # flatten value of each item when expired

      normal_modifier(item.name).times { normal_update(item) } # adjust value of each item by a certain amount

      item.sell_in.pass_modifier.times { item.quality.update } if item.name.backstage_pass?
      # recognises if something is a backstage pass; if it is, it modifies its rate of update according to how many days are left

      one_day_less(item) # lowers how many days left on item's sell_in
    end
  end

  private

  def normal_update(item)
    item.quality.update unless item.name.special_item? # checks if something isn't one of the special items that have different ways of updating or limits on them, and executes Quality's usual update routine (which goes up or down depending on how item Quality was initialised)
  end

  def one_day_less(item)
    item.sell_in.update # lowrs how many days left
  end

  def remove_all_value_when_expired(item)
    item.quality.flatline if item.sell_in.days_left <= 0
  end

  def normal_modifier(name)
    return 2 if name.to_s.include? 'Conjured'
    1
  end

  end
