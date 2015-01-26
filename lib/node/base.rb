module Node
  class Base
    attr_reader :value, :left, :right

    def self.build(token, left = nil, right = nil)
      case token.to_s
      when /\A\d+\z/
        Node::Numeric.new(token.to_i, left, right)
      when /\A[a-z]+\z/
        Node::Variable.new(token.to_s, left, right)
      when *operator_symbols
        operator_class(token).new(token.to_s, left, right)
      else
        fail Error::UnknownToken, "Unknown token #{token.inspect}"
      end
    end

    def self.register_operator(token, klass)
      @operators ||= {}
      @operators[token] = klass
    end

    def self.operators
      @operators ||= {}
    end

    def self.operator_class(token)
      operators.fetch(token)
    end

    def self.operator_symbols
      operators.keys
    end

    def self.operator?(token)
      operators.key?(token)
    end

    def initialize(value, left = nil, right = nil)
      @value = value
      @left  = left
      @right = right
    end

    def to_postfix
      value.to_s
    end

    alias_method :to_prefix, :to_postfix
    alias_method :to_infix,  :to_postfix
  end
end
