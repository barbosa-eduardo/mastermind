# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'

class Game
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
  end

  def play
    puts 'Do you wish to play as Code Breaker or Maker? (maker/breaker)'
    answer = ''
    answer = gets.chomp.downcase until %w[breaker maker].include?(answer)
    play_breaker if answer == 'breaker'
    play_maker if answer == 'maker'
  end

  def play_breaker
    code_maker.generate_code
    12.times do |i|
      puts "\nRound #{i + 1}"
      guess = code_breaker.input_guess
      puts "Your guess is #{guess.join(' ')}"
      return end_game('victory') if guess == code_maker.code

      puts "\n#{code_maker.get_feedback(guess)}"
    end
    end_game('defeat')
  end

  def play_maker
  end

  private

  attr_accessor :code, :pegs, :code_breaker, :code_maker

  def end_game(state)
    if state == 'victory'
      puts 'Congratulations! The code was discovered.'
    elsif state == 'defeat'
      puts 'You lost! More luck next time.'
    end
  end
end
