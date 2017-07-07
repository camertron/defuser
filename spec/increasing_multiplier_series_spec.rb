require 'spec_helper'

include Defuser

describe IncreasingMultiplierSeries do
  describe '.match' do
    let(:sequence) { [2, 4, 12, 48] }
    let(:solution) { IncompleteArray.new(sequence) }

    subject { described_class.match(solution) }

    it 'correctly identifies a matching series' do
      is_expected.to be_matched
      is_expected.to_not be_empty
    end

    it 'includes a reference to the correct series class' do
      expect(subject.series).to eq(described_class)
    end

    it 'includes the given sequence' do
      expect(subject.sequence).to eq(sequence)
    end

    it 'includes the correct steps' do
      expect(subject.steps.map { |s| s.normalize!.to_s }).to eq([
        '2 * 2 = 4',
        '4 * 3 = 12',
        '12 * 4 = 48',
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [2, 4, 12, 49] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
