require 'spec_helper'

include Defuser

describe Solver do
  let(:puzzle) { Puzzle.new([85, nil, nil, 79, 79], [82, 83, 80, 84]) }

  describe '.solve' do
    it 'solves the puzzle' do
      match = described_class.solve(puzzle)
      expect(match).to be_a(SeriesMatch)
      expect(match.sequence).to eq([85, 82, 80, 79, 79])
      expect(match.series).to eq(GeometricSeries)
      expect(match.steps.map { |s| s.normalize!.to_s }).to eq([
        '85 - 3 = 82',
        '82 - 2 = 80',
        '80 - 1 = 79',
        '79 + 0 = 79'
      ])
    end
  end
end
