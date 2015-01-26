require "node"

class Expression
  # Returns a new Expression
  def initialize(expr)
    @expr = expr
  end

  # Evaluates an expression, simplifying if possible.
  #
  # @param bindings [Hash] a map of variable names to concrete values
  # @return [Expression] Returns a possibly-simplified Expression
  def evaluate(bindings = {})
    Expression.new(tree.evaluate(bindings).to_postfix)
  end

  def to_s
    @expr
  end

  private

  def tokens
    @expr.split
  end

  def tree
    @tree ||= tokens.reduce([]) do |stack, token|
      if Node::Base.operator?(token)
        left, right = stack.pop(2)
        stack.push(Node::Base.build(token, left, right))
      else
        stack.push(Node::Base.build(token))
      end
    end.pop
  end
end
