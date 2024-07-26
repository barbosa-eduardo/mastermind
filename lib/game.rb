# frozen_string_literal: true

require_relative 'codebreaker'
require_relative 'codemaker'

# Contains the logic for the game
class Game
  ROUNDS = 12
  def initialize
    @breaker = CodeBreaker.new
    @maker = CodeMaker.new
    @results = []
  end

  def play
    option = input_option
    reset
    ROUNDS.times do |i|
      result = play_breaker if option == 'breaker'
      result = play_maker if option == 'maker'
      return end_game(true) if result[1]

      results << ("#{i + 1}. #{result[0]}")
      puts results[i]
    end
    end_game(false)
  end

  def play_breaker
    guess = breaker.input_guess
    feedback = maker.generate_feedback(guess)
    ["#{guess} #{feedback}", maker.won?(guess)]
  end

  def play_maker
  end

  private

  attr_accessor :breaker, :maker, :results

  def input_option
    loop do
      print 'Do you wish to play as the Code Maker or Code Breaker? (breaker/maker): '
      answer = gets.chomp.downcase
      return answer if %w[breaker maker].include?(answer)
    end
  end

  def reset
    maker.random_code
    self.results = []
  end

  def end_game(code_discovered)
    if code_discovered
      puts 'The secret code was discovered!'
    else
      puts 'Game ended! The code was not uncovered.'
    end
  end
end
