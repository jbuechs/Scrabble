require "./lib/scrabble.rb"
module Scrabble
  class Player
    attr_reader :name, :plays, :highest_scoring_word

    def initialize(name)
      @name = name
      @plays = []
      @highest_scoring_word = ""
    end

    def play(word)
      if won?
        return false
      end
      @plays.push(word)
      if @highest_scoring_word == "" || Scrabble.score(word) > Scrabble.score(@highest_scoring_word)
        @highest_scoring_word = word
      end
    end

    def total_score
      score = 0
      @plays.each do |word|
        score += Scrabble.score(word)
      end
      return score
    end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

  end

end
