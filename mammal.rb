module Mammal
  def breathe_air
    puts "inhale air"
  end
end

module Feline
  def purr
    puts "purrrr"
  end
end

class Cat
  include Feline
  include Mammal
end

cat = Cat.new
cat.purr
cat.breathe_air