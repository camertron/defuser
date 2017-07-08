module Defuser
  # @TODO
  # / 5, / 4, / 3, etc
  class DecreasingDivisorSeries
    class << self
      def match(arr)
        EmptySeriesMatch.instance
      end

      def description
        'decreasing divisor series'
      end
    end
  end
end
