class User
  def initialize(first_name: , last_name:, lang:)
    @first_name = first_name
    @last_name = last_name
    @lang = lang
  end

  def full_name
    full_name_strategy.full_name
  end

  private

  def full_name_strategy
    case @lang
    when 'en'
      EnStrategy.new(@first_name, @last_name)
    when 'ja'
      JaStrategy.new(@first_name, @last_name)
    end
  end
end

class FullNameStrategy
  def initialize(first_name ,last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    raise NotImplementedError
  end
end

class EnStrategy < FullNameStrategy
  def full_name
    "#{@first_name} #{@last_name}"
  end
end

class JaStrategy < FullNameStrategy
  def full_name
    "#{@last_name} #{@first_name}"
  end
end

puts User.new(first_name: '孝慈', last_name: '中村', lang: 'ja').full_name
puts User.new(first_name: 'Koji', last_name: 'Nakamura', lang: 'en').full_name
