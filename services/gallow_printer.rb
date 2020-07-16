module Services
  class GallowPrinter
    class << self
      def print(wrong_answers:)
        case wrong_answers
        when 0
          wrong0
        when 1
          wrong1
        when 2
          wrong2
        when 3
          wrong3
        when 4
          wrong4
        when 5
          wrong5
        when 6
          wrong6
        end
      end

      def wrong0
        puts "
        +---+
        |   |
            |
            |
            |
            |
      ========="
      end

      def wrong1
        puts "
        +---+
        |   |
        O   |
            |
            |
            |
      ========="
      end

      def wrong2
        puts "
        +---+
        |   |
        O   |
        |   |
            |
            |
      ========="
      end

      def wrong3
        puts "
        +---+
        |   |
        O   |
       -|   |
            |
            |
      ========="
      end

      def wrong4
        puts "
        +---+
        |   |
        O   |
       -|-  |
            |
            |
      ========="
      end

      def wrong5
        puts "
        +---+
        |   |
        O   |
       -|-  |
       /    |
            |
      ========="
      end

      def wrong6
        puts "
        +---+
        |   |
        O   |
       -|-  |
       / \\  |
            |
      ========="
      end
    end
  end
end