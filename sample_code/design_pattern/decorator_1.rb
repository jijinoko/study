class Component
  def operation
    raise NotImplementedError
  end
end

class ConcreteComponent < Component
  def operation
    "ConcreteComponent"
  end
end

class Decorator < Component
  def initialize(component)
    @component = component
  end

  def operation
    @component.operation
  end
end

class ConcreteDecoratorA < Decorator
  def operation
    "ConcreteDecoratorA(#{@component.operation})"
  end
end

class ConcreteDecoratorB < Decorator
  def operation
    "ConcreteDecoratorB(#{@component.operation})"
  end
end

component = ConcreteComponent.new
decorator_a = ConcreteDecoratorA.new(component)
decorator_b = ConcreteDecoratorB.new(decorator_a)

puts decorator_b.operation
