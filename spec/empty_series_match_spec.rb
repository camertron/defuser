require 'spec_helper'

include Defuser

describe EmptySeriesMatch do
  it 'does not allow new instances' do
    expect { described_class.new }.to raise_error(NoMethodError)
  end

  describe '#instance' do
    it 'returns an instance' do
      expect(described_class.instance).to be_a(described_class)
    end

    it 'returns the only instance' do
      expect(described_class.instance.object_id).to(
        eq(described_class.instance.object_id)
      )
    end
  end
end
