require 'spec_helper'

include Defuser

describe DivisorSeries do
  describe '.match' do
    let(:sequence) { [122, 61, 30.5, 15.25] }
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
        '122 / 2 = 61',
        '61 / 2 = 30.5',
        '30.5 / 2 = 15.25'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [122, 62, 30.5, 15.25] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
