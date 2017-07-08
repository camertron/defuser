require 'spec_helper'

include Defuser

describe IncompleteArray do
  subject { described_class.new([1, nil, nil, 4], [2, 3]) }

  describe '#each' do
    it 'inlines replacements where nils exist in the original array' do
      expect(subject.to_a).to eq(
        [1, 2, 3, 4]
      )
    end
  end

  describe '#each_cons_pair' do
    it 'inlines replacements and yields a sliding window of two elements' do
      expect(subject.each_cons_pair.to_a).to eq(
        [[1, 2], [2, 3], [3, 4]]
      )
    end
  end

  describe '#size' do
    it 'returns the size of the array' do
      expect(subject.size).to eq(4)
    end
  end
end
