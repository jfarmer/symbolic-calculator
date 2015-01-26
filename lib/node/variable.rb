module Node
  class Variable < Base
    def evaluate(bindings = {})
      bindings.key?(value) ? Node::Base.build(bindings[value]) : self
    end
  end
end
