# frozen_string_literal: true

require_relative 'code'

# Constains the logic of the Code Maker
class CodeMaker < Code
  def initialize
    super
    @code = ''
  end

  def random_code
    code = ''
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

  def generate_feedback(guess); end

  def input_feedback(guess)
    loop do
      print "Guess: #{guess} - Feedback: "
      feedback = gets.chomp
      break if feedback_valid?(feedback)

      puts 'Feedback invalid! Try again.'
    end
  end

  def feedback_valid?(feedback)
    return false unless feedback.length == 4

    arr = feedback.chars
    return false unless arr[0].ord.between?(48, 52) && arr[2].ord.between?(48, 52)
    return false unless arr[1] == 'A' && arr[3] == 'B'

    true
  end

  def won?(guess)
    guess == code
  end

  private

  attr_accessor :code
end

c = CodeMaker.new
c.input_feedback('1234')
