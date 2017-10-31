require 'sellby'

describe SellBy do
  describe 'sellby initialisation' do
    it 'has a sellby date' do
      expect(SellBy.new(10).days_left).to eq 10
    end

    it 'can be a special object' do
      expect(SellBy.new(10, 'Backstage passes to a TAFKAL80ETC concert').special_object).to eq 'Backstage passes to a TAFKAL80ETC concert'
    end

    it 'can lower days left' do
      selly = SellBy.new(10)
      expect(selly.update).to eq 9
    end

    it 'modifier returns 2 if 7 days left of backstage pass' do
      selly = SellBy.new(7, 'Backstage passes to a TAFKAL80ETC concert')
      expect(selly.modifier).to eq 2
    end

    it 'modifier no modifier if 7 days left of normal object' do
      selly = SellBy.new(7)
      expect(selly.modifier).to eq nil
    end



  end

end
