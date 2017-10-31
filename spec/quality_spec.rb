require 'quality'

describe Quality do

  let(:a_quality){Quality.new(0)}

  describe 'base quality property' do
    it 'can be increased' do
      expect(a_quality.change_quality(2)).to eq (2)
    end

    it 'can be decreased' do
      a_quality.change_quality(2)
      expect(a_quality.change_quality(-1)).to eq (1)
    end
  end

  describe 'immortal objects' do
    it 'cannot be changed' do
      immortal_quality = Quality.new(50)
      expect(a_quality.change_quality(-1))
    end
  end
end
