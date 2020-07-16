module Services
  class Greetings
    def self.welcome!
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

    def self.goodbye! (won_the_game: false)
    end
  end
end