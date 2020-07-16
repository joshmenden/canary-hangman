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

  def guess_letter letter
    if @guessed_letters.include? letter
      raise InvalidGuessError.new("You've already guessed this letter! Letter: #{letter}")
    end
  end

  def welcome_user!
    a = Artii::Base.new :font => 'isometric1'
    puts a.asciify("Hangman").light_green

    puts "\n\n"
    puts "Welcome to Hangman!"
    puts "Created by Josh Menden, July 2020".light_black
    puts "\n\n"
    puts "The rules are simple:\n"
    puts "👉 Pick a difficulty: easy or hard"
    puts "👉 Guess letters - you get 6 incorrect guesses!"
    puts "\nAre you ready?\n\n"


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