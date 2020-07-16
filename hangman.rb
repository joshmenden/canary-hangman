Dir["./services/*.rb"].each {|file| require file }
Dir["./errors/*.rb"].each {|file| require file }
require('artii')
require 'colorize'

class Hangman
  ALLOWED_INCORRECT_GUESSES = 6

  def initialize
    @secret_word = Services::WordGenerator.call
    @guessed_letters = []
    @known_letters = []
    @incorrect_guesses = 0
  end

  def welcome_user!
    Services::Greetings.welcome!
  end

  def guess_letter letter
    if @guessed_letters.include? letter
      raise InvalidGuessError.new("You've already guessed this letter!")
    end

    @guessed_letters.push(letter)
    if @secret_word.include?(letter)
      @known_letters.push(letter)
      return true
    else
      @incorrect_guesses += 1
      return false
    end
  end

  def new_turn!
    Services::GallowPrinter.print(wrong_answers: @incorrect_guesses)
    print_coded_word
    puts "\nWhat letter would you like to guess?"
    letter = gets.chomp
    success = guess_letter(letter)
    if success
      puts "\nAlright! You guessed correctly!"
    else
      puts "\nDang it! This letter is not in the word!"
    end

  rescue InvalidGuessError => e
    puts "\n#{e}"
  ensure
    puts "\n====================================".light_cyan
  end

  def print_coded_word
    encoded = @secret_word.split("").map {|letter| @known_letters.include?(letter) ? letter : "_" }.join("")
    puts "\nSecret Word: #{encoded}\n"
  end

  def has_guessed_the_word?
    @known_letters.sort == @secret_word.split("").sort
  end

  def has_lost_the_game?
    @incorrect_guesses >= ALLOWED_INCORRECT_GUESSES
  end

  def finished?
    has_guessed_the_word? || has_lost_the_game?
  end
end