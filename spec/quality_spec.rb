require 'quality'

describe Quality do
  describe 'base quality property' do
    it 'can be increased' do
      a_quality = Quality.new(0)
      expect(a_quality.increase_quality(2)).to eq (2)
    end
  end
end
