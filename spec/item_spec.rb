require 'item'

describe Item do
  let(:test_quality) do
    double('Quality', quality: 50, change_quality_50_by_2: 48)
  end

  describe 'item initialisation' do
    it 'can print name' do
      new_item = Item.new('foo', SellBy.new(10), Quality.new(50))
      expect(new_item.to_s).to eq 'foo, 10, 50'
    end
  end
end
