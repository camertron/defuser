module Defuser
  class IncompleteArray
    include Enumerable

    attr_reader :arr, :replacements

    def initialize(arr, replacements = [])
      @arr = arr
      @replacements = replacements
    end

    def each
      return to_enum(__method__) unless block_given?

      counter = 0

      arr.each do |element|
        if element
          yield element
        else
          yield replacements[counter]
          counter += 1
        end
      end
    end

    # an efficient implementation of each_cons(2) that doesn't allocate any
    # intermediate objects
    def each_cons_pair
      return to_enum(__method__) unless block_given?

      last_elem = nil

      each_with_index do |elem, idx|
        if idx == 0
          last_elem = elem
          next
        end

        yield last_elem, elem
        last_elem = elem
      end
    end

    def size
      arr.size
    end
  end
end
