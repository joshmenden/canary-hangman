require "httparty"

module Services
  class WordGenerator

    WORD_DIFFICULTIES = {
      :hard => {
        :min => 9,
        :max => Float::INFINITY
      },
      :easy => {
        :min => 3,
        :max => 8
      }
    }

    def self.call(difficulty: :hard)
      new(difficulty: difficulty).call
    end

    def call
      generate_word
    end

    private

    def initialize(difficulty:)
      @difficulty = difficulty
      @base_url = "https://random-word-api.herokuapp.com/word?swear=0&number=50"
      @word = nil
    end

    def generate_word
      # the only free random word API I could find didn't allow to
      # specify letter length so let's just go with this for now...
      while @word.nil? do
        words = JSON.parse(HTTParty.get(@base_url).body)
        words.each do |word|
          next if word.length < WORD_DIFFICULTIES[@difficulty][:min]
          next if word.length > WORD_DIFFICULTIES[@difficulty][:max]
          @minimum_letter_length
          @word = word
          break
        end
      end

      return @word
    end
  end
end