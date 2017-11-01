require 'name'

describe ItemName do
  describe 'after creation' do
    it 'can get name as string' do
      expect(ItemName.new('Conjured').to_s).to eq 'Conjured'
    end
  end
end
