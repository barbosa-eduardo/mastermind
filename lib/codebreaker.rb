# frozen_string_literal: false

require_relative 'code'

# Contains the logic for the Code Breaker
class CodeBreaker < Code
  def initialize
    super
    @feedbacks = []
    @guesses = []
    @code = []
    @permutations = []
    generate_permutations
  end

  def input_guess
    loop do
      print 'Guess: '
      guess = gets.chomp
      return guess if valid?(guess)

      puts 'Invalid code! Try again.'
    end
  end

  def generate_guess
    guess = ''

    # Save and return guess
    guesses << guess
    guess
  end

  def reset
    self.feedbacks = []
    self.guesses = []
  end

  def receive_feedback(feedback)
    feedbacks << feedback
  end

  private

  attr_accessor :feedbacks, :guesses, :code, :permutations

  def generate_permutations(pos = 0)
    if pos == CODE_LENGTH
      permutations << code.join
      return
    end
    VALID_DIGITS.each do |char|
      code << char
      generate_permutations(pos + 1)
      code.pop
    end
  end
end
