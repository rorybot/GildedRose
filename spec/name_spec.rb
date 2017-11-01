require 'name'

describe ItemName do
  describe 'after creation' do
    it 'can get name as string' do
      expect(ItemName.new('Conjured').to_s).to eq 'Conjured'
    end

    it 'checks if backstage_pass' do
      pass = ItemName.new('Backstage passes to a TAFKAL80ETC concert')
      expect(pass.backstage_pass?).to eq true
    end
  end
end
