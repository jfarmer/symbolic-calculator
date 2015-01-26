module Node
  class Operator
    class Multiplication < Operator
      self.operator_token = "*"

      def evaluate(bindings = {})
        lhs, rhs = left.evaluate(bindings), right.evaluate(bindings)

        if lhs.is_a?(Node::Numeric) && rhs.is_a?(Node::Numeric)
          Node::Numeric.new(lhs.value * rhs.value)
        elsif lhs.value == 0 || rhs.value == 0
          Node::Numeric.new(0)
        elsif lhs.value == 1
          rhs
        elsif rhs.value == 1
          lhs
        else
          Node::Base.build(value, lhs, rhs)
        end
      end
    end
  end
end
