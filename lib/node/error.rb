module Node
  class Error < StandardError
    class UnknownToken < Error; end
    class UnsupportedOperation < Error; end
  end
end
