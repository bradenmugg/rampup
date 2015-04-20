class Word
  def say_word(word)
    puts "#{word}"
  end
  def say_secret_word
    puts secret_word
  end
  private
  def secret_word
    "this is a secret"
  end
end

word = Word.new
word.say_word("hello")
word.say_secret_word