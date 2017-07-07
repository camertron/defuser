require 'spec_helper'

include Defuser

describe IncreasingDivisorSeries do
  describe '.match' do
    let(:sequence) { [78.0, 39.0, 13.0, 3.25, 0.65] }
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
      expect(subject.steps.map(&:to_s)).to eq([
        '78.0 / 2 = 39.0',
        '39.0 / 3 = 13.0',
        '13.0 / 4 = 3.25',
        '3.25 / 5 = 0.65'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [78.0, 39.0, 12.0, 3.25, 0.65] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
