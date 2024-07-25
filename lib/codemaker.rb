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
      self.code = gets.chomp
      break if valid?(code)
    end
  end

  private

  attr_accessor :code
end
