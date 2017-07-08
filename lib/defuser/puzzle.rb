module Defuser
  class Puzzle
    attr_reader :circuit, :fuses

    def initialize(circuit, fuses)
      @circuit = circuit
      @fuses = fuses
      normalize!
    end

    def each_solution
      return to_enum(__method__) unless block_given?

      fuses.permutation(num_missing).each do |fuse_perm|
        yield IncompleteArray.new(circuit, fuse_perm)
      end
    end

    private

    def num_missing
      circuit.count { |elem| elem.nil? }
    end

    def normalize!
      if float_normalize?
        circuit.map! { |elem| elem.to_f if elem }
        fuses.map! { |elem| elem.to_f if elem }
      end
    end

    def float_normalize?
      float?(circuit) || float?(fuses)
    end

    def float?(arr)
      arr.any? { |elem| elem.is_a?(Float) }
    end
  end
end
