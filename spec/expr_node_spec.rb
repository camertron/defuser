require 'spec_helper'

include Defuser

describe ExprNode do
  subject { described_class.new(:plus, 1, -2) }

  describe '#to_s' do
    it 'serializes the expression into a string' do
      expect(subject.to_s).to eq('1 + -2')
    end
  end

  describe '#normalize!' do
    it 'changes the plus into a minus' do
      expect(subject.normalize!.to_s).to eq('1 - 2')
    end
  end

  context 'with multiple levels' do
    subject do
      described_class.new(
        :eq, described_class.new(:plus, described_class.new(:mult, 1, 2), 2), 2
      )
    end

    describe '#to_s' do
      it 'adds paretheses' do
        expect(subject.to_s).to eq('(1 * 2) + 2 = 2')
      end
    end
  end
end
