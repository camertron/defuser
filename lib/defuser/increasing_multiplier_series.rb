module Defuser
  # x2, x3, x4, etc
  class IncreasingMultiplierSeries
    MULT_START_MIN = 2
    MULT_START_MAX = 10

    class << self
      def match(arr)
        (MULT_START_MIN..MULT_START_MAX).each do |starting_multiplier|
          multipliers = starting_multiplier.upto(starting_multiplier + arr.size)

          arr.each_cons_pair do |first, second|
            multiplier = multipliers.next
            return EmptySeriesMatch.instance if first * multiplier != second
          end

          return SeriesMatch.new(self, arr.to_a, steps(arr, starting_multiplier))
        end

        EmptySeriesMatch.instance
      end

      private

      def steps(arr, starting_multiplier)
        arr.each_cons_pair.map.with_index do |(first, second), idx|
          ExprNode.new(:eq, ExprNode.new(:mult, first, starting_multiplier + idx), second)
        end
      end
    end
  end
end
