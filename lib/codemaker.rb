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
      break if valid?(code)

      puts "The code must contain only #{CODE_LENGTH} digits. Valid digits: #{VALID_DIGITS.join(' ')}"
    end
  end

  private

  attr_accessor :code
end

c = CodeMaker.new
c.input_code
