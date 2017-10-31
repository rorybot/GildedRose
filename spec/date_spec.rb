require 'sellby'

describe SellBy do
  describe 'sellby initialisation' do
    it 'has a sellby date' do
      expect(SellBy.new('20/11/2017').expires).to eq Time.parse("20/11/2017")
    end

    it 'can see how many days are left' do
      selly = SellBy.new('20/11/2017')
      expect(selly.days_left('19/11/2017')).to eq 1
    end
  end
end
