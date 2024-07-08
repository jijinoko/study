# リクエスト、命令、振る舞いそのものをオブジェクトとしてカプセル化することでアクションの要求者と実行者を分離する
# CommandはReceiverをコンポジション
# Receiverはアクションの実装
# InvokerはCommandオブジェクトをセッターメソッドで受け取り、executeメソッドを呼び出す

class Command
  def execute
    raise NotImplementedError
  end
end

class ConcreteCommand < Command
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    @receiver.starting_action
  end
end

class Receiver
  def starting_action
    puts 'Starting action doing...'
  end
end

class Invoker
  def on_start=(command)
    @on_start = command
  end

  def do_something
    @on_start.execute

    puts 'Main action doing...'
  end
end

invoker = Invoker.new
invoker.on_start = ConcreteCommand.new(Receiver.new)
invoker.do_something
