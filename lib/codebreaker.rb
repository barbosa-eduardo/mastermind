# frozen_string_literal: true

require_relative 'code'

# Contains the logic for the Code Breaker
class CodeBreaker < Code
  def initialize
    super
    @feedbacks = []
    @guesses = []
  end

  def input_guess
    loop do
      print 'Guess: '
      guess = gets.chomp
      return guess if valid?(guess)

      puts 'Invalid code! Try again.'
    end
  end

  def generate_guess; end

  def reset
    self.feedbacks = []
    self.guesses = []
  end

  private

  attr_accessor :feedbacks, :guesses
end
