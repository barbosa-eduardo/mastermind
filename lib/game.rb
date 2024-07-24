# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def generate_code
    4.times { code.push(pegs.sample) }
  end

  def generate_feedback(guess)
    feedback = []
    guess.each_with_index do |item, index|
      feedback.push(rate_guess(item, index))
    end
    feedback.shuffle
  end

  private

  attr_accessor :code, :pegs

  def rate_guess(item, position)
    if item == code[position]
      return 'correct'
    elsif code[position..].include?(item)
      return 'wrong position'
    end

    'wrong'
  end
end

game = Game.new
game.generate_code
p game.feedback(%w[green blue orange blue])
