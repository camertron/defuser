module Defuser
  class EmptySeriesMatch
    class << self
      def instance
        @instance ||= new
      end

      private :new
    end

    def empty?
      true
    end

    def matched?
      false
    end
  end
end
