require 'quality'

describe Quality do
  let(:a_quality) { Quality.new(1) }

  describe 'base quality property' do
    it 'can be decreased' do
      expect(a_quality.update).to eq 0
    end

    it 'cannot go past 50' do
      fifty_quality = Quality.new(50,false,true)
      expect(fifty_quality.update).to eq "No can do"
    end

    it 'cannot go below 0' do
      a_quality.update
      expect(a_quality.update).to eq "No can do"
    end

  end

  describe 'immortal objects' do
    it 'cannot be changed' do
      immortal_quality = Quality.new(50, true)
      expect(immortal_quality.update).to eq "No can do"
    end
  end

  describe 'growing quality objects' do
    it 'increases in quality if a grower' do
      grower_quality = Quality.new(30,false, true)
      expect(grower_quality.update).to eq(31)
    end
  end

end
