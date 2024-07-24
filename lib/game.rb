# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def play
  end

  def generate_code
    4.times { code.push(pegs.sample) }
    p code
  end

  def input_guess
  end

  def generate_feedback(guess)
  end

  private

  attr_accessor :code, :pegs
end

game = Game.new
game.play
