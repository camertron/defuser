module Defuser
  class Solver
    class << self
      def solve(puzzle)
        puzzle.each_solution do |solution|
          if match = find_match(solution)
            return match
          end
        end

        EmptySeriesMatch.instance
      end

      private

      def find_match(solution)
        Defuser.series
          .lazy
          .map { |series| series.match(solution) }
          .find(&:matched?)
      end
    end
  end
end
