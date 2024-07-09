class Context
  def initialize(state)
    transition_to(state)
  end

  def transition_to(state)
    @state = state
    puts "#{@state.class}に遷移しました"
    @state.context = self
  end

  def request1
    @state.handle1
  end

  def request2
    @state.handle2
  end
end

class State
  attr_accessor :context

  def handle1
    raise NotImplementedError
  end

  def handle2
    raise NotImplementedError
  end
end

class ConcreteStateA < State
  def handle1
    puts 'StateAの処理1ではごにょごにょする'
  end

  def handle2
    puts 'StateAの処理2ではほげほげする'
    @context.transition_to(ConcreteStateB.new)
  end
end

class ConcreteStateB < State
  def handle1
    puts 'StateBの処理1ではふがふがする'
  end

  def handle2
    puts 'StateBの処理2ではぴよぴよする'
    @context.transition_to(ConcreteStateA.new)
  end
end

context = Context.new(ConcreteStateA.new)
context.request1
context.request2
context.request1
context.request2
