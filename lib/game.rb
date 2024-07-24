# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def play
    generate_code
    12.times do
      guess = input_guess
      if guess == code
        end_game('victory')
        break
      end
      puts get_feedback(guess)
    end
    end_game('defeat')
  end

  private

  attr_accessor :code, :pegs

  def generate_code
    4.times { code.push(pegs.sample) }
  end

  def input_guess
  end

  def end_game(state)
    if state == 'victory'
      puts 'victory'
    elsif state == 'defeat'
      puts 'defeat'
    end
    puts "The code was #{code}"
  end

  def get_feedback(guess)
  end
end

game = Game.new
game.play
