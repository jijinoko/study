class Japanese
  def greet
    'こんにちは!'
  end
end

class American
  def greet
    'Hello!'
  end
end

class Adapter < Japanese
  def initialize(american)
    @american = american
  end

  def greet
    "コンニチハ! (Translated: 「#{@american.greet}」)"
  end
end

american = American.new
puts american.greet
japanese = Japanese.new
puts japanese.greet
puts Adapter.new(american).greet
