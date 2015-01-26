module Node
  class Operator < Base
    def self.operator_token
      @operator_token
    end

    def self.operator_token=(operator_token)
      Node::Base.register_operator(operator_token, self)
      @operator_token = operator_token
    end

    def to_prefix
      "#{value} #{left.to_postfix} #{right.to_postfix}"
    end

    def to_infix
      "(#{left.to_infix} #{value} #{right.to_infix})"
    end

    def to_postfix
      "#{left.to_postfix} #{right.to_postfix} #{value}"
    end

    def evaluate(bindings = {})
      fail Error::UnsupportedOperationError,
        "Unsupported operation #{value.inspect}"
    end
  end
end
