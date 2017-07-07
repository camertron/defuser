module Defuser
  # / 2, / 3, / 4, etc
  class IncreasingDivisorSeries
    DIV_START_MIN = 2
    DIV_START_MAX = 10

    class << self
      def match(arr)
        (DIV_START_MIN..DIV_START_MAX).each do |div_start|
          divisors = div_start.upto(div_start + arr.size)

          arr.each_cons_pair do |first, second|
            divisor = divisors.next
            return EmptySeriesMatch.instance if first / divisor != second
          end

          return SeriesMatch.new(self, arr.to_a, sequence(arr, div_start))
        end

        EmptySeriesMatch.instance
      end

      private

      def sequence(arr, divisor)
        arr.each_cons_pair.map.with_index do |(first, second), idx|
          ExprNode.new(:eq, ExprNode.new(:div, first, divisor + idx), second)
          # "#{first} / #{divisor + idx} = #{second}"
        end
      end
    end
  end
end
