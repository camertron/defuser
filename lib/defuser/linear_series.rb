module Defuser
  class LinearSeries
    class << self
      def match(arr)
        difference = nil

        arr.each_cons_pair do |first, second|
          difference ||= second - first
          return EmptySeriesMatch.instance if second - first != difference
        end

        SeriesMatch.new(self, arr.to_a, steps(arr))
      end

      private

      def steps(arr)
        arr.each_cons_pair.map do |first, second|
          difference ||= second - first
          ExprNode.new(:eq, ExprNode.new(:plus, first, difference), second)
          # "#{first} + #{difference} = #{second}"
        end
      end
    end
  end

  register_series(LinearSeries)
end
