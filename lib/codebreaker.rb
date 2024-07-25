# frozen_string_literal: true

# Contains the logic for the Code Breaker
class CodeBreaker < Code
  def initialize
    super
    @feedbacks = []
    @guesses = []
  end

  def input_guess
  end

  def generate_guess
  end

  private

  attr_accessor :feedbacks, :guesses
end
