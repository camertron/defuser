require 'set'

require 'defuser/constant_multiplier_series'
require 'defuser/decreasing_divisor_series'
require 'defuser/decreasing_multiplier_series'
require 'defuser/divisor_series'
require 'defuser/geometric_series'
require 'defuser/increasing_divisor_series'
require 'defuser/increasing_multiplier_series'
require 'defuser/linear_series'
require 'defuser/multiplier_series'

module Defuser
  autoload :EmptySeriesMatch, 'defuser/empty_series_match'
  autoload :ExprNode,         'defuser/expr_node'
  autoload :IncompleteArray,  'defuser/incomplete_array'
  autoload :Puzzle,           'defuser/puzzle'
  autoload :SeriesMatch,      'defuser/series_match'
  autoload :Solver,           'defuser/solver'

  class << self
    def register_series(klass)
      series << klass
    end

    def series
      @series ||= Set.new
    end
  end

  # order matters!
  register_series(LinearSeries)
  register_series(MultiplierSeries)
  register_series(DivisorSeries)
  register_series(GeometricSeries)
  register_series(ConstantMultiplierSeries)
  register_series(IncreasingMultiplierSeries)
  register_series(DecreasingMultiplierSeries)

  register_series(IncreasingDivisorSeries)
  register_series(DecreasingDivisorSeries)
end
