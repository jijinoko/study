class MyClass
  def request_1
    puts 'request_1の処理'
  end

  def request_2
    puts 'request_2の処理'
  end

  def request_3
    puts 'request_3の処理'
  end
end

class UnusedMethodCheckProxy
  def initialize(object)
    @object = object
  end

  def method_missing(name, *args)
		output_log(name)

		@object.send(name, *args)
	end

  def output_log(name)
    puts "【不要コード調査】#{@object.class}##{name} called."
  end
end

my_object = MyClass.new
proxy = UnusedMethodCheckProxy.new(my_object)

proxy.request_1
proxy.request_2
