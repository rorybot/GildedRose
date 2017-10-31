require 'gilded_rose'
require 'quality'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, Quality.new(10))]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'reduces by 1' do
      items = [Item.new('foo', 10, Quality.new(10))]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end
  end
end
