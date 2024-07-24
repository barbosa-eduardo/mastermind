require_relative 'code'

class CodeMaker < Code
  attr_reader :code

  def initialize
    super
    @code = []
  end

  def generate_code
    CODE_LENGTH.times { code.push(pegs.sample) }
  end

  def get_feedback(guess)
    code = Array.new(self.code)
    correct = 0
    missed = 0
    guess.each_with_index do |item, index|
      next unless item == code[index]

      guess[index] = nil
      code[index] = nil
      correct += 1
    end

    guess.compact!
    code.compact!

    guess.each_index do |i|
      code.each_index do |j|
        next unless guess[i] == code[j]

        guess[i] = nil
        code[j] = nil
        missed += 1
        break
      end
    end
    guess.compact!
    "correct: #{correct}\nwrong position: #{missed}\nwrong: #{guess.length}"
  end
end
