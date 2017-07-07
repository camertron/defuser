module Defuser
  class GeometricSeries
    class << self
      def match(arr)
        diffs = arr.each_cons(2).map { |(first, second)| second - first }
        return EmptySeriesMatch.instance if diffs.size <= 2
        linear_match = linear_series.match(IncompleteArray.new(diffs))

        if linear_match.matched?
          SeriesMatch.new(self, arr.to_a, steps(arr, diffs))
        else
          EmptySeriesMatch.instance
        end
      end

      private

      def steps(arr, diffs)
        arr.each_cons_pair.map.with_index do |(first, second), idx|
          ExprNode.new(:eq, ExprNode.new(:plus, first, diffs[idx]), second)
        end
      end

      def linear_series
        LinearSeries
      end
    end
  end
end
