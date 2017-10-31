require 'quality'

describe Quality do
  describe 'base quality property' do
    it 'can be increased' do
      a_quality = Quality.new
      expect(a_quality.increase).to eq (2)
    end
  end
end
