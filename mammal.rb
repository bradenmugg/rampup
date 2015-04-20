class Mammal
  def breathe
    puts "Inhale and Exhale"
  end
end

class Human < Mammal
  def walk
    puts "walking"
  end
end

class Dolphin < Human
  def swim
    puts "swimming"
  end
end

person = Human.new
person.walk
person.breathe

dolphin = Dolphin.new
dolphin.swim
dolphin.breathe
dolphin.walk