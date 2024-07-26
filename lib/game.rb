# frozen_string_literal: true

require_relative 'codebreaker'
require_relative 'codemaker'

# Contains the logic for the game
class Game
  ROUNDS = 12
  def initialize
    @breaker = CodeBreaker.new
    @maker = CodeMaker.new
  end

  def start
    option = input_option
    reset
    puts
    ROUNDS.times do |i|
      result = play(option)
      return end_game(true) if result[1]

      puts "#{i + 1}. #{result[0]}"
    end
    end_game(false)
  end

  def play(option)
    case option
    when 'breaker'
      play_breaker
    when 'maker'
      play_maker
    end
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
      print 'Play as the Code Maker or Breaker? (breaker/maker): '
      answer = gets.chomp.downcase
      return answer if %w[breaker maker].include?(answer)
    end
  end

  def reset
    maker.random_code
    breaker.reset
  end

  def end_game(code_discovered)
    if code_discovered
      puts 'The secret code was discovered!'
    else
      puts 'Game ended! The code was not uncovered.'
    end
    puts
  end
end
