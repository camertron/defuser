module Defuser
  class MultiplierSeries
    class << self
      def match(arr)
        multiplier = nil

        arr.each_cons_pair do |first, second|
          return EmptySeriesMatch.instance if first == 0
          return EmptySeriesMatch.instance if second % first > 0
          multiplier ||= second / first
          return EmptySeriesMatch.instance if second / first != multiplier
        end

        SeriesMatch.new(self, arr.to_a, steps(arr, multiplier))
      end

      private

      def steps(arr, multiplier)
        arr.each_cons_pair.map do |first, second|
          ExprNode.new(:eq, ExprNode.new(:mult, first, multiplier), second)
        end
      end
    end
  end
end
