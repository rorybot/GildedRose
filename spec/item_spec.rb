require 'item'

describe Item do

  describe 'item initialisation' do
    it 'can print name' do
      new_item = Item.new('Thing', 0, 0)
      expect(new_item.to_s).to eq "Thing, 0, 0"
    end
  end
end
