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
  end
end
