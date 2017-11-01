require 'gilded_rose'
require 'quality'
require 'sellby'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', SellBy.new(10), Quality.new(10))]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
      expect(items[0].sell_in.days_left).to eq 9
    end

    it 'reduces by 1' do
      items = [Item.new('foo', SellBy.new(10), Quality.new(10))]
      GildedRose.new(items).update_quality
      expect(items[0].quality.quality).to eq 9
      expect(items[0].sell_in.days_left).to eq 9
    end

    it 'cannot go past 50' do
      items = [Item.new('foo', SellBy.new(10), Quality.new(50, false, true))]
      GildedRose.new(items).update_quality
      expect(items[0].quality.quality).to eq 50
      expect(items[0].sell_in.days_left).to eq 9
    end

    it 'cannot go below 0' do
      items = [Item.new('foo', SellBy.new(10), Quality.new(0))]
      GildedRose.new(items).update_quality
      expect(items[0].quality.quality).to eq 0
      expect(items[0].sell_in.days_left).to eq 9
    end

    context 'conjured items' do
      it 'increases twice as fast if a conjured item' do
        items = [Item.new('Magic Pie [Conjured]', SellBy.new(10), Quality.new(10))]
        GildedRose.new(items).update_quality
        p items[0].name
        expect(items[0].quality.quality).to eq 8
        expect(items[0].sell_in.days_left).to eq 9
      end
    end

    context 'tickets' do
      it 'increase ticket price by 3 when 5 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', SellBy.new(5), Quality.new(10, false, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 13
        expect(items[0].sell_in.days_left).to eq 4
      end

      it 'increase ticket price by 2 when 10 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', SellBy.new(10), Quality.new(10, false, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 12
        expect(items[0].sell_in.days_left).to eq 9
      end

      it 'increase ticket price by 1 when 11 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', SellBy.new(11), Quality.new(10, false, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 11
        expect(items[0].sell_in.days_left).to eq 10
      end

      it 'ticket price goes to 0 when -1 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', SellBy.new(0), Quality.new(10, false, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 0
      end
    end

    context 'Sulfuras' do
      it 'does not change' do
        items = [Item.new('foo', SellBy.new(10), Quality.new(30, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 30
        expect(items[0].sell_in.days_left).to eq 9
      end
    end

    context 'Aged Brie' do
      it 'goes up in value' do
        items = [Item.new('foo', SellBy.new(10), Quality.new(30, false, true))]
        GildedRose.new(items).update_quality
        expect(items[0].quality.quality).to eq 31
        expect(items[0].sell_in.days_left).to eq 9
      end
    end
  end
end
