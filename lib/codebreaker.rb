# frozen_string_literal: false

require_relative 'code'

# Contains the logic for the Code Breaker
class CodeBreaker < Code
  def initialize
    super
    @feedbacks = []
    @guesses = []
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
    guess = self.guess

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

  attr_accessor :feedbacks, :guesses, :permutations

  def generate_permutations
    code = []
    permutate(code)
    p permutations
  end

  def permutate(code, pos = 0)
    if pos == CODE_LENGTH
      permutations << code.join
      return
    end
    VALID_DIGITS.each do |char|
      code << char
      permutate(code, pos + 1)
      code.pop
    end
  end

  def guess
    return VALID_DIGITS.sample(CODE_LENGTH).join if guesses.empty?

    guess = guesses.last
    feedback = feedbacks.last
    correct = feedback[0].to_i
    included = feedback[2].to_i
    filter_permutations(guess, correct, included)
    permutations.sample
  end

  def filter_permutations(code, correct, included)
    permutations.each_with_index do |p, i|
      cor = count_identical_chars(code, p)
      inc = count_common_chars(code, p)
      permutations[i] = nil if cor < correct || (inc - cor) < included
    end
    permutations.compact!
    permutations.delete(code)
  end

  def count_identical_chars(code1, code2)
    identical_chars = 0
    code1.chars.each_with_index do |c1, i|
      identical_chars += 1 if c1 == code2[i]
    end
    identical_chars
  end

  def count_common_chars(code1, code2)
    common_chars = 0
    code1.each_char do |c1|
      common_chars += 1 if code2.include?(c1)
    end
    common_chars
  end
end
