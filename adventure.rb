class Humanoid
  attr_accessor :weapon, :armor, :speed

def attack

end

def 
end

class Elf < Humanoid
  def initialize
    @weapon = 5
    @armor = 5
    @speed = 10
  end

end

class Orc < Humanoid
  def initialize
    @weapon = 5
    @armor = 10
    @speed = 5
  end 

end

class Human < Humanoid
  def initialize
    @weapon = 10 
    @armor = 5
    @speed = 5
  end
  
end

class Room

end

class Game

  def choose_character
    puts "Choose your character type (Elf, Orc, or Human)"
    character = gets.chomp
    return character
  end

  def create_character(character)
    case character

    when 'Elf'

      hero = Elf.new

    when 'Human'

      hero = Human.new

    when 'Orc'

      hero = Orc.new

    end

    return hero

  end

  def choose_room
    puts "Choose a room (A, B, C, D)"
    room = gets.chomp
  end

  def choose_enemy
    enemies = [Elf, Human, Orc, None]
    room_defender = enemies.shuffle.last
    return room_defender
  end

  def place_enemy(room_defender)
    case room_defender
    when 'Elf'
      defender = Elf.new
    when 'Human'
      defender = Human.new
    when 'Orc'
      defender = Orc.new
    return defender
  end

  def fight (hero, defender)
    
      

    
end


