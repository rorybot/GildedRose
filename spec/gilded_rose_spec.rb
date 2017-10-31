require 'gilded_rose'
require 'quality'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'reduces by 1' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end

    # it 'increase quality' do
    #   items = [Item.new('Sulfuras, Hand of Ragnaros', 10, Quality.new(10,true))]
    #   expect(GildedRose.new(items).update_quality).to eq "No can do"
    # end

    context 'tickets' do
      it 'increase ticket price by 3 when 5 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 13
      end

      it 'increase ticket price by 2 when 10 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 12
      end

      it 'increase ticket price by 1 when 11 days left' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 11
      end
    end

    context 'Sulfuras' do
      it 'does not change' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 30)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 30
      end
    end

    context 'Aged Brie' do
      it 'goes up in value' do
        items = [Item.new('Aged Brie', 1, 30)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 31
      end
    end
  end
end
