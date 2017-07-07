module Defuser
  class EmptySeriesMatch
    def self.instance
      @instance ||= new
    end

    def empty?
      true
    end

    def matched?
      false
    end

    private :initialize
  end
end
