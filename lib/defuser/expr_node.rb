module Defuser
  class ExprNode
    attr_reader :operation, :left, :right

    def initialize(operation, left, right)
      @operation = operation
      @left = left
      @right = right
    end

    def to_s(depth = 0)
      ''.tap do |result|
        result << '(' if depth > 1
        result << "#{left_s(depth)} #{op_s} #{right_s(depth)}"
        result << ')' if depth > 1
      end
    end

    def normalize!
      left.normalize! if left_node?

      if right_node?
        right.normalize!
        return self
      end

      if operation == :plus && right < 0
        @operation = :minus
        @right *= -1
      end

      self
    end

    private

    def left_s(depth)
      left_node? ? left.to_s(depth + 1) : left.to_s
    end

    def right_s(depth)
      right_node? ? right.to_s(depth + 1) : right.to_s
    end

    def left_node?
      left.is_a?(self.class)
    end

    def right_node?
      right.is_a?(self.class)
    end

    def op_s
      case operation
        when :plus  then '+'
        when :minus then '-'
        when :mult  then '*'
        when :div   then '/'
        when :eq    then '='
      end
    end
  end
end
