require 'spec_helper'

include Defuser

describe GeometricSeries do
  describe '.match' do
    let(:sequence) { [63, 64, 63, 60, 55] }
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
        '63 + 1 = 64',
        '64 - 1 = 63',
        '63 - 3 = 60',
        '60 - 5 = 55'
      ])
    end

    context 'with an invalid sequence' do
      let(:sequence) { [63, 64, 63, 60, 56] }

      it 'returns an empty match' do
        is_expected.to_not be_matched
        is_expected.to be_empty
      end
    end
  end
end
