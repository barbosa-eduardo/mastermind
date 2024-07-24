# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def generate_code
    4.times { code.push(pegs.sample) }
  end

  private

  attr_accessor :code, :pegs
end

game = Game.new
game.generate_code
