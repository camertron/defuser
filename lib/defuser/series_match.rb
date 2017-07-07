module Defuser
  class SeriesMatch
    attr_reader :series, :sequence, :steps

    def initialize(series, sequence, steps)
      @series = series
      @sequence = sequence
      @steps = steps
    end

    def empty?
      false
    end

    def matched?
      true
    end
  end
end
