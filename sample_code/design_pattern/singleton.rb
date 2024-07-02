class SampleSingleton
  attr_reader :value

  def initialize(value)
    @value = value
    puts 'SampleSingleton instance created.'
  end

  def self.instance(value)
    @instance ||= new(value)
  end

  private_class_method :new
end

s1 = SampleSingleton.instance('FIRST')
s2 = SampleSingleton.instance('SECOND')

puts s1.value
puts s2.value

process1 = Thread.new { puts SampleSingleton.instance('FIRST').value }
process2 = Thread.new { puts SampleSingleton.instance('SECOND').value }
process1.join
process2.join
