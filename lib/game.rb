# frozen_string_literal: true

require_relative 'code_maker'

class Game
  def initialize
    @code_maker = CodeMaker.new
  end

  def play
    code_maker.generate_code
    12.times do |i|
      puts "\nRound #{i + 1}"
      guess = input_guess
      puts "Your guess is #{guess.join(' ')}"
      return end_game('victory') if guess == code_maker.code

      puts "\n#{get_feedback(guess)}"
    end
    end_game('defeat')
  end

  private

  attr_accessor :code, :pegs

  def end_game(state)
    if state == 'victory'
      puts 'Congratulations! The code was discovered.'
    elsif state == 'defeat'
      puts 'You lost! More luck next time.'
    end
    puts "The code was #{code.join(' ')}"
  end
end
