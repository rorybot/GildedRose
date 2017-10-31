require 'sellby'

describe SellBy do
  describe 'sellby initialisation' do
    it 'has a sellby date' do
      expect(SellBy.new('20/11/2017').expires).to eq '20/11/2017'
    end
  end
end
