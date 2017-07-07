require 'spec_helper'

include Defuser

describe MultiplierSeries do
  describe '.match' do
    let(:sequence) { [3, 9, 27, 81] }
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
        '3 * 3 = 9',
        '9 * 3 = 27',
        '27 * 3 = 81'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [3, 9, 27, 82] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
