module Defuser
  class DivisorSeries
    class << self
      def match(arr)
        divisor = nil

        arr.each_cons_pair do |first, second|
          return EmptySeriesMatch.instance if second == 0
          return EmptySeriesMatch.instance if first % second > 0
          divisor ||= first / second
          return EmptySeriesMatch.instance if first / second != divisor
        end

        SeriesMatch.new(self, arr.to_a, steps(arr, divisor))
      end

      private

      def steps(arr, divisor)
        arr.each_cons_pair.map do |first, second|
          ExprNode.new(:eq, ExprNode.new(:div, first, divisor), second)
          # "#{first} / #{divisor} = #{second}"
        end
      end
    end
  end

  register_series(DivisorSeries)
end
