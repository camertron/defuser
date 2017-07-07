module Defuser
  # eg. x2 + 8, x2 + 10, etc
  class ConstantMultiplierSeries
    MULT_MIN = 2
    MULT_MAX = 8

    class << self
      def match(arr)
        (MULT_MIN..MULT_MAX).each do |multiplier|
          match = linear_series.match(
            IncompleteArray.new(
              arr.each_cons_pair.map do |first, second|
                second - (first * multiplier)
              end
            )
          )

          if match.matched?
            return SeriesMatch.new(self, arr.to_a, steps(arr, multiplier))
          end
        end

        EmptySeriesMatch.instance
      end

      private

      def steps(arr, multiplier)
        arr.each_cons_pair.map do |first, second|
          extra = second - (first * multiplier)
          ExprNode.new(:eq, ExprNode.new(:plus, ExprNode.new(:mult, first, multiplier), extra), second)
          # "(#{first} * #{multiplier}) + #{extra} = #{second}"
        end
      end

      def linear_series
        LinearSeries
      end
    end
  end

  register_series(ConstantMultiplierSeries)
end
