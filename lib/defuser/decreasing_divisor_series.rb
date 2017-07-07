module Defuser
  # @TODO
  # / 5, / 4, / 3, etc
  class DecreasingDivisorSeries
    class << self
      def match(arr)
        EmptySeriesMatch.instance
      end
    end
  end

  register_series(DecreasingDivisorSeries)
end
