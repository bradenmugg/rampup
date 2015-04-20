class Person
  @@array = Array.new
  attr_accessor :name, :gender, :skin, :hair, :eye, :guilty
  def initialize(name, gender, skin, hair, eye)
    @name = name
    @gender = gender
    @skin = skin
    @hair = hair
    @eye = eye
    @@array << self
  end
  def self.all_instances
    @@array
  end
end

  def assign_guilt(array)
    num = array.length
    guilted = rand (0..(num-1))
    array.each do |person|
      person.guilty = 'no'
    end
    array[guilted].guilty = 'yes'
    return array[guilted]
  end

rachel = Person.new('rachel', 'girl', 'black', 'auburn', 'brown')
mac = Person.new('mac', 'boy', 'white', 'black', 'brown')
nick = Person.new('nick', 'boy', 'white', 'brown', 'blue')
angie = Person.new('angie', 'girl', 'white', 'auburn', 'green')
theo = Person.new('theo', 'boy', 'white', 'blonde', 'brown')
joshua = Person.new('joshua', 'boy', 'white', 'black', 'brown')
emily = Person.new('emily', 'girl', 'white', 'blonde', 'blue')
jason = Person.new('jason', 'boy', 'white', 'blonde', 'green')
john = Person.new('john', 'boy', 'white', 'brown', 'blue')
jake = Person.new('jake', 'boy', 'white', 'brown', 'brown')
megan = Person.new('megan', 'girl', 'white', 'blonde', 'green')
ryan = Person.new('ryan', 'boy', 'white', 'auburn', 'brown')
brandon = Person.new('brandon', 'boy', 'white', 'blonde', 'brown')
beth = Person.new('beth', 'girl', 'white', 'blonde', 'brown')
diane = Person.new('diane', 'girl', 'black', 'brown', 'brown')
chris = Person.new('chris', 'boy', 'white', 'black', 'green')
david = Person.new('david', 'boy', 'black', 'black', 'brown')
michelle = Person.new('michelle', 'girl', 'black', 'black', 'brown')
tyson = Person.new('tyson', 'boy', 'black', 'black', 'brown')
ursula = Person.new('ursula', 'girl', 'white', 'auburn', 'green')

suspect_list = []
puts "Suspects:"
Person.all_instances.each do |person|
  puts person.name
  suspect_list.push(person)
end
suspect = assign_guilt(suspect_list)

count = 0
while count < 3
  puts "Choose an attribute: 1. gender 2. skin color 3. hair color 4. eye color:"
  attribute = gets.chomp.to_i
  case attribute
  when 1
    puts "Enter a gender (boy or girl):"
    value = gets.chomp
    if suspect.gender == value
      puts "The suspect is a #{value}"
      suspect_list.select! do |person|
        if person.gender == value
          person
        end
      end
    else
      puts "The suspect is not a #{value}"
      suspect_list.select! do |person|
        if person.gender != value
          person
        end
      end
    end
  when 2
    puts "Enter a skin color (black or white)"
    value = gets.chomp
    if suspect.skin == value
      puts "The suspect's skin color is #{value}"
      suspect_list.select! do |person|
        if person.skin == value
          person
        end
      end
    else
      suspect_list.select! do |person|
        if person.skin != value
          puts "The suspect's skin color is not #{value}"
          person
        end
      end
    end
  when 3
    puts "Enter a hair color (auburn, black, brown, blonde)"
    value = gets.chomp
    if suspect.hair == value
      puts "The suspect's hair color is #{value}"
        suspect_list.select! do |person|
        if person.hair == value
          person
        end
      end
    else
      puts "The suspect's hair color is not #{value}"
      suspect_list.select! do |person|
        if person.hair != value
          person
        end
      end
    end
  when 4 
    puts "Enter an eye color (brown, green, or blue) "
    value = gets.chomp
    if suspect.eye == value
      puts "The suspect's eye color is #{value}"
      suspect_list.select! do |person|
        if person.eye == value
          person
        end
      end
    else
      puts "The suspect's eye color is not #{value}"
      suspect_list.select! do |person|
        if person.eye != value
          person
        end
      end
    end
  end
  suspect_list.each do |x|
    puts x.name
  end
  puts "Guess a suspect from the list:"
  guess = gets.chomp
  if guess == suspect.name
    puts "That is correct! You win!"
    break
  else
    puts "That is not correct"
    suspect_list.select! do |person|
      if person.name != guess
        person
      end
    end
  end
  count += 1
end
if count == 3
  puts "You are out of guesses. Better luck next time."
end
