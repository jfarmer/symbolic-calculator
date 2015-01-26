require "node/numeric"
require "node/operator"

module Node
  class Operator
    class Division < Operator
      self.operator_token = "/"

      def evaluate(bindings = {})
        lhs, rhs = left.evaluate(bindings), right.evaluate(bindings)

        if lhs.is_a?(Node::Numeric) && rhs.is_a?(Node::Numeric)
          Node::Numeric.new(lhs.value / rhs.value)
        elsif rhs.value == lhs.value
          Node::Numeric.new(1)
        elsif rhs.value == 1
          lhs
        else
          Node::Base.build(value, lhs, rhs)
        end
      end
    end
  end
end
