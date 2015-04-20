class Deck
  def shuffle
    @array.shuffle!
  end
  def draw
    top_card = @array.pop
    return top_card
  end
  private
  @array = []
  def initialize
    @array = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10]
  end
end

class Game
  private

  def initialize
    @the_bankroll = 500
    @the_deck = []
    (1..5).each do
      temp_deck = Deck.new
      temp_deck.shuffle
      @the_deck.push(temp_deck)
    end
    @player_hand = []
    @dealer_hand = []
    run_menu
  end
  
  def player_turn
    player_choice = 0
    while player_choice != 2
      puts "Your hand: #{@player_hand}"
      puts "The dealer's hand: [#{@dealer_hand[1]}, ?]"
      puts "Would you like to: "
      puts "1. Hit"
      puts "2. Stay"
      player_choice = gets.chomp.to_i
      if player_choice == 1
        @player_hand << @the_deck.shuffle.last.draw
        puts "You drew a #{@player_hand.last}"
      else
        return
      end
      if (@player_hand.inject(:+)) > 21
        puts "You are over 21. You lose."
        return
      end
    end
  end

  def dealer_turn
    while @dealer_hand.inject(:+) < 17
      @dealer_hand << @the_deck.shuffle.last.draw
      puts "The dealer drew a #{@dealer_hand.last}"
    end
  end

  def run_game
    place_bet
    @player_hand = []
    @dealer_hand = []
    @player_hand << @the_deck.shuffle.last.draw
    @dealer_hand << @the_deck.shuffle.last.draw
    @player_hand << @the_deck.shuffle.last.draw
    @dealer_hand << @the_deck.shuffle.last.draw
    player_turn
    if (@player_hand.inject(:+)) > 21
      return
    end
    dealer_turn
    if @dealer_hand.inject(:+) >= 22
      puts "The dealer's hand is #{@dealer_hand}"
      puts "The dealer busts. You win!"
      win_bet
      return
    end
    puts "Your hand is #{@player_hand}"
    puts "The dealer's hand is #{@dealer_hand}"
    if @player_hand.inject(:+) >= @dealer_hand.inject(:+)
      puts "You are closer to 21. You win!"
      win_bet
      return
    end
    puts "The dealer is closer to 21. You lose."
    return
  end

  def check_bank
    puts "You currently have $ #{@the_bankroll}"
  end

  def place_bet
    puts "How much money would you like to bet?"
    @bet_amount = gets.chomp.to_i
    @the_bankroll -= @bet_amount
    puts "You currently have $ #{@the_bankroll}"
  end

  def win_bet
    @the_bankroll += (2 * @bet_amount)
    puts "You currently have $ #{@the_bankroll}"
  end

  def run_menu
    menu_choice = 0
    while menu_choice != 3
      if @the_bankroll <= -1000
        puts "You currently have $ #{@the_bankroll}"
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
      else menu_choice ==3
        exit
      end
    end
  end
end

Game.new