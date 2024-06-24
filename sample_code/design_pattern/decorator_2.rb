class StringConverter
  def initialize(string)
    @string = string
  end

  def convert
    raise NotImplementedError
  end
end

class UpCaseConverter < StringConverter
  def convert
    @string.upcase
  end
end

class CommaConverter < StringConverter
  def convert
    @string.gsub(/,/, "\n")
  end
end

class ReverseConverter < StringConverter
  def convert
    @string.reverse
  end
end

class HashValueConverter < StringConverter
  def convert
    @string.hash
  end
end

string = "Hello, World"
upcase = UpCaseConverter.new(string)
comma = CommaConverter.new(string)
reverse = ReverseConverter.new(string)
hash = HashValueConverter.new(string)
all = HashValueConverter.new(ReverseConverter.new(CommaConverter.new(UpCaseConverter.new(string))))

puts upcase.convert
puts comma.convert
puts reverse.convert
puts hash.convert
puts all.convert
