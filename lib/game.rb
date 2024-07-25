# frozen_string_literal: true

require_relative 'codebreaker'
require_relative 'codemaker'

# Contains the logic for the game
class Game
  def initialize
    @breaker = CodeBreaker.new
    @maker = CodeMaker.new
  end

  private

  attr_accessor :breaker, :maker
end
