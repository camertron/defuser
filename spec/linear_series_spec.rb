require 'spec_helper'

include Defuser

describe LinearSeries do
  describe '.match' do
    let(:sequence) { [27, 33, 39, 45] }
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
        '27 + 6 = 33',
        '33 + 6 = 39',
        '39 + 6 = 45'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [27, 34, 39, 45] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
