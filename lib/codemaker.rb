# frozen_string_literal: false

require_relative 'code'

# Constains the logic of the Code Maker
class CodeMaker < Code
  def initialize
    super
    @code = ''
  end

  def random_code
    self.code = ''
    CODE_LENGTH.times { code << VALID_DIGITS.sample }
  end

  def input_code
    loop do
      print 'Type the secret code: '
      self.code = gets.chomp
      puts
      break if valid?(code)

      puts "The code must contain only #{CODE_LENGTH} digits. Valid digits: #{VALID_DIGITS.join(' ')}"
    end
  end

  def generate_feedback(guess)
    correct = count_correct(guess)
    incorrect = count_incorrect(guess)
    "#{correct}A#{incorrect}B"
  end

  def input_feedback(guess)
    loop do
      print "Guess: #{guess} - Feedback: "
      feedback = gets.chomp
      return feedback if feedback_valid?(feedback)

      puts 'Feedback invalid! Try again.'
    end
  end

  def won?(guess)
    guess == code
  end

  private

  attr_accessor :code

  def count_correct(guess)
    correct = 0
    guess.chars.each_with_index do |char, index|
      correct += 1 if char == code.chars[index]
    end
    correct
  end

  def count_incorrect(guess)
    incorrect = 0
    guess.chars.uniq.each do |char|
      incorrect += [guess.count(char), code.count(char)].min if code.include?(char)
    end
    incorrect -= count_correct(guess)
    [0, incorrect].max
  end

  def feedback_valid?(feedback)
    return false unless feedback.length == 4

    arr = feedback.chars
    return false unless arr[0].ord.between?(48, 52) && arr[2].ord.between?(48, 52)
    return false unless arr[1] == 'A' && arr[3] == 'B'

    true
  end
end
