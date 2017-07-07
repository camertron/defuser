require 'spec_helper'

include Defuser

describe ConstantMultiplierSeries do
  describe '.match' do
    let(:sequence) { [8, 25, 77, 234, 706] }
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
        '(8 * 3) + 1 = 25',
        '(25 * 3) + 2 = 77',
        '(77 * 3) + 3 = 234',
        '(234 * 3) + 4 = 706'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [8, 25, 77, 234, 707] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
