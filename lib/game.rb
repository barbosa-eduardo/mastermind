# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def play
    generate_code
    12.times do
      guess = input_guess
      if guess == code
        end_game('victory')
        return
      end
      puts get_feedback(guess)
    end
    end_game('defeat')
  end

  private

  attr_accessor :code, :pegs

  def generate_code
    4.times { code.push(pegs.sample) }
  end

  def input_guess
    puts 'Type your guess:'
    gets.chomp.split
  end

  def end_game(state)
    if state == 'victory'
      puts 'victory'
    elsif state == 'defeat'
      puts 'defeat'
    end
    puts "The code was #{code}"
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
    "correct: #{correct}\nwrong position #{missed}\n#{guess.length} wrong"
  end
end

game = Game.new
game.play
