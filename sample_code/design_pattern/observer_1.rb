class Controller
  def initialize
    @observers = []
  end

  def register(observer)
    @observers << observer
  end

  def turn_on
    @observers.each do |observer|
      observer.turn_on
    end
  end

  def turn_off
    @observers.each do |observer|
      observer.turn_off
    end
  end
end

class Light
  attr_accessor :power

  def turn_on
    return if power

    @power = true
    puts '照明がついた'
  end

  def turn_off
    return unless power

    @power = false
    puts '照明が消えた'
  end
end

class Television
  attr_accessor :power

  def turn_on
    return if power

    @power = true
    puts 'テレビがついた'
  end

  def turn_off
    return unless power

    @power = false
    puts 'テレビが消えた'
  end
end

light = Light.new
television = Television.new
controller = Controller.new

controller.register(light)
controller.turn_on

controller.register(television)
controller.turn_on
controller.turn_off
