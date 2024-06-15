class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def execute_with_strategy
    @strategy.execute
  end
end

class Strategy
  def execute
    raise NotImplementedError
  end
end

class ConcreteStrategyA < Strategy
  def execute
    puts "Executing ConcreteStrategyA"
  end
end

class ConcreteStrategyB < Strategy
  def execute
    puts "Executing ConcreteStrategyB"
  end
end

strategy = ConcreteStrategyA.new
context = Context.new(strategy)
context.execute_with_strategy

context.strategy = ConcreteStrategyB.new
context.execute_with_strategy
