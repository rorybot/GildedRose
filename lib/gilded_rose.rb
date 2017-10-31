require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item| # iterates over every item
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert') # excludes Aged Brie from quality reductiondue to special date increase of quality; excludes pass from quality reduction due to special date increase of quality

        if item.quality > 0 # Checks that item cannot go into negative quality
          if item.name != 'Sulfuras, Hand of Ragnaros' # Checks that item is not a special type that can never lose quality (true/false status)
            item.quality = item.quality - 1 # reduces quality
          end
        end

      else # special zproperty rules

        if item.quality < 50 # items are limited at a quality of 50
          item.quality = item.quality + 1 # increases quality of special item
          if item.name == 'Backstage passes to a TAFKAL80ETC concert' # checks if pass, and institutes rules for it
            if item.sell_in < 11 # special quality rules for when it is less than ten days till expiration date, but more than 5
              if item.quality < 50 # checs again that quality of item is still not 50
                item.quality = item.quality + 1 # increases quality
              end
            end
            if item.sell_in < 6 # special qialuty rules for when less than 6 days left before expiration date
              if item.quality < 50 # checks again taht quality of item is still not 50
                item.quality = item.quality + 1 # increases quality (Needs something to drop it to zero though)
              end
            end
          end
        end

      end

      if item.name != 'Sulfuras, Hand of Ragnaros' # checks not Sulfuras, which never degrase (true/false)
        item.sell_in = item.sell_in - 1 # decreases sell_by_date
      end

      if item.sell_in < 0 # checks if expiration date has passed
        if item.name != 'Aged Brie' # brie is special; do not degrade
          if item.name != 'Backstage passes to a TAFKAL80ETC concert' # passes are special and must nto degrade
            if item.quality > 0 # checks if quality hasn't dropped below zero
              if item.name != 'Sulfuras, Hand of Ragnaros' # cehcks not specialsulfuras which never degrades
                item.quality = item.quality - 1 # reduces quality
              end
            end
          else
            item.quality = item.quality - item.quality # deletes quality of concert pass
          end
        else
          if item.quality < 50 # checks not less than 50
            item.quality = item.quality + 1 # normal item quality enchancer
          end
        end

      end
    end
  end
end
