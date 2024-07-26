# frozen_string_literal: false

require_relative 'code'

# Contains the logic for the Code Breaker
class CodeBreaker < Code
  def initialize
    super
    @feedbacks = []
    @guesses = []
    @code_digits = ''
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
    # Discover digits present in the secret code
    find_code_digits unless code_digits.length == CODE_LENGTH
    guess = code_digits.length < CODE_LENGTH ? guess_digits : make_guess

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

  attr_accessor :feedbacks, :guesses, :code_digits

  def find_code_digits
    guesses.each_with_index do |guess, index|
      digit = guess.chars[0]
      feedback = feedbacks[index].chars
      qtd = feedback[0].to_i + feedback[2].to_i
      qtd.times { code_digits << digit }
    end
    reset if code_digits.length == CODE_LENGTH
  end

  def guess_digits
    guess = ''
    CODE_LENGTH.times { guess << VALID_DIGITS[guesses.length] } if feedbacks.length < VALID_DIGITS.length
    guess
  end

  def make_guess
    guess = guesses.empty? ? code_digits : ''
    guesses.each_with_index do |item, index|
    end
    guess
  end
end
