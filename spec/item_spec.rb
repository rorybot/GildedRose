require 'item'

describe Item do
  let(:test_quality) do
    double('Quality', quality: 50, change_quality_50_by_2: 48)
  end

  describe 'item initialisation' do
    it 'can print name' do
      new_item = Item.new('Thing', 0, test_quality.quality)
      expect(new_item.to_s).to eq 'Thing, 0, 50'
    end
  end
end
