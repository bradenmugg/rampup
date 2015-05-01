class Deck
  def shuffle
    self.array.shuffle!
  end
  def draw
    top_card = @array.pop
    return top_card
  end
  attr_accessor :array
  def initialize
    self.array = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10]
  end
end

class Game
  attr_accessor :the_bankroll, :the_deck, :player_hand, :dealer_hand, :bet_amount
  def initialize
    self.the_bankroll = 500
    self.the_deck = []
    (1..5).each do
      temp_deck = Deck.new
      temp_deck.shuffle
      self.the_deck.push(temp_deck)
    end
    self.player_hand = []
    self.dealer_hand = []
    run_menu
  end
  
  def player_turn
    player_choice = 0
    while player_choice != 2
      puts "Your hand: #{self.player_hand}"
      puts "The dealer's hand: [#{self.dealer_hand[1]}, ?]"
      puts "Would you like to: "
      puts "1. Hit"
      puts "2. Stay"
      player_choice = gets.chomp.to_i
      if player_choice == 1
        self.player_hand << self.the_deck.shuffle.last.draw
        puts "You drew a #{self.player_hand.last}"
      else
        return
      end
      if (self.player_hand.inject(:+)) > 21
        puts "You are over 21. You lose."
        return
      end
    end
  end

  def dealer_turn
    while self.dealer_hand.inject(:+) < 17
      self.dealer_hand << self.the_deck.shuffle.last.draw
      puts "The dealer drew a #{@dealer_hand.last}"
    end
  end

  def run_game
    place_bet
    self.player_hand = []
    self.dealer_hand = []
    self.player_hand << self.the_deck.shuffle.last.draw
    self.dealer_hand << self.the_deck.shuffle.last.draw
    self.player_hand << self.the_deck.shuffle.last.draw
    self.dealer_hand << self.the_deck.shuffle.last.draw
    player_turn
    if (self.player_hand.inject(:+)) > 21
      return
    end
    dealer_turn
    if self.dealer_hand.inject(:+) >= 22
      puts "The dealer's hand is #{self.dealer_hand}"
      puts "The dealer busts. You win!"
      win_bet
      return
    end
    puts "Your hand is #{self.player_hand}"
    puts "The dealer's hand is #{self.dealer_hand}"
    if self.player_hand.inject(:+) >= self.dealer_hand.inject(:+)
      puts "You are closer to 21. You win!"
      win_bet
      return
    end
    puts "The dealer is closer to 21. You lose."
    return
  end

  def check_bank
    puts "You currently have $ #{self.the_bankroll}"
  end

  def place_bet
    puts "How much money would you like to bet?"
    self.bet_amount = gets.chomp.to_i
    self.the_bankroll -= self.bet_amount
    puts "You currently have $ #{self.the_bankroll}"
  end

  def win_bet
    self.the_bankroll += (2 * self.bet_amount)
    puts "You currently have $ #{self.the_bankroll}"
  end

  def run_menu
    menu_choice = 0
    while menu_choice != 3
      if self.the_bankroll <= -1000
        puts "You currently have $ #{self.the_bankroll}"
        puts "You owe the bank too much money. You've been thrown out!"
        exit
      end
      puts "1. Check bank-roll"
      puts "2. Play game"
      puts "3. Exit game"
      menu_choice = gets.chomp.to_i
      if menu_choice == 1
        check_bank
      elsif menu_choice == 2
        run_game
      else menu_choice == 3
        exit
      end
    end
  end
end

Game.new