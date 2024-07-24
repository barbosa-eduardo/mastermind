# frozen_string_literal: true

class Game
  def initialize
    @code = []
    @pegs = %w[red green blue yellow orange purple]
  end

  def play
    generate_code
    12.times do |i|
      puts "\nRound #{i + 1}"
      guess = input_guess
      puts "Your guess is #{guess.join(' ')}"
      return end_game('victory') if guess == code

      puts "\n#{get_feedback(guess)}"
    end
    end_game('defeat')
  end

  private

  attr_accessor :code, :pegs

  def generate_code
    4.times { code.push(pegs.sample) }
  end

  def input_guess
    puts(pegs.each_index.reduce(String.new) { |sum, i| sum + "| #{i + 1} - #{pegs[i]} |" })
    puts 'The code has 4 colors. To guess type the number or the name of the color.'
    guess = gets_guess
    until validate_guess(guess)
      puts 'Invalid guess! Type the number or color separated by white space. Example: 1 5 2 4'
      guess = gets_guess
    end
    guess
  end

  def gets_guess
    guess = gets.chomp.split
    guess.map do |item|
      if item.ord.between?(48, 57)
        i = item.to_i - 1
        pegs[i]
      else
        item
      end
    end
  end

  def validate_guess(guess)
    return invalid_size unless guess.length == code.length

    guess.each do |item|
      return invalid_number if item.nil?
      return invalid_color unless pegs.include?(item)
    end

    true
  end

  def invalid_size
    puts "\nThe code has #{code.length} colors!"
    false
  end

  def invalid_number
    puts "Type numbers between 1 and #{pegs.length}."
    false
  end

  def invalid_color
    puts "\n#{item} is invalid!"
    false
  end

  def end_game(state)
    if state == 'victory'
      puts 'Congratulations! The code was discovered.'
    elsif state == 'defeat'
      puts 'You lost! More luck next time.'
    end
    puts "The code was #{code.join(' ')}"
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
