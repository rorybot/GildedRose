require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item| # iterates over every item
      # excludes Aged Brie from quality reductiondue to special date increase of quality; excludes pass from quality reduction due to special date increase of quality

      item.quality.update # Checks that item cannot go into negative quality

      if item.name == 'Backstage passes to a TAFKAL80ETC concert' # checks if pass, and institutes rules for it
          item.quality.update if item.sell_in < 11 # checs again that quality of item is still not 50

          item.quality.update if item.sell_in < 6
      end

      item.sell_in = item.sell_in - 1 # decreases sell_by_date
    end
  end
end
