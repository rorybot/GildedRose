require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item| # iterates over every item
# excludes Aged Brie from quality reductiondue to special date increase of quality; excludes pass from quality reduction due to special date increase of quality

        item.quality.update if item.quality.quality > 0 && item.quality.quality < 50 # Checks that item cannot go into negative quality


        if item.name == 'Backstage passes to a TAFKAL80ETC concert' # checks if pass, and institutes rules for it

          if item.sell_in < 11 # special quality rules for when it is less than ten days till expiration date, but more than 5
            item.quality.update if item.quality.quality < 50 # checs again that quality of item is still not 50
            # increases quality
          end

          if item.sell_in < 6 # special qialuty rules for when less than 6 days left before expiration date
            item.quality.update if item.quality.quality < 50 # checks again taht quality of item is still not 50
            # increases quality (Needs something to drop it to zero though)
          end
        end



      item.sell_in = item.sell_in - 1 # decreases sell_by_date



    end
  end
end
