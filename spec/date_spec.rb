require 'sellby'

describe SellBy do
  describe 'sellby initialisation' do
    it 'has a sellby date' do
      expect(SellBy.new(10).days_left).to eq 10
    end

    it 'can lower days left' do
      selly = SellBy.new(10)
      expect(selly.update).to eq 9
    end

    it 'modifier returns 1 if 11 days left of backstage pass' do
      selly = SellBy.new(4)
      expect(selly.modifier).to eq 3
    end

    it 'modifier returns 2 if 7 days left of backstage pass' do
      selly = SellBy.new(7)
      expect(selly.modifier).to eq 2
    end

    it 'modifier returns 3 if 4 days left of backstage pass' do
      selly = SellBy.new(4)
      expect(selly.modifier).to eq 3
    end
  end
end
