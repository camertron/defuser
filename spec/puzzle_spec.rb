require 'spec_helper'

include Defuser

describe Puzzle do
  describe '#each_solution' do
    subject { Puzzle.new([1, nil, nil, 4], [2, 3]) }

    it 'yields all possible permutations' do
      expect(subject.each_solution.to_a.map(&:to_a)).to eq(
        [[1, 2, 3, 4], [1, 3, 2, 4]]
      )
    end
  end
end
