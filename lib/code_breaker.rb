class CodeBreaker < Code
  def initialize
    super
  end

  def input_guess
    puts(PEGS.each_index.reduce(String.new) { |sum, i| sum + "| #{i + 1} - #{PEGS[i]} |" })
    puts 'The code has 4 colors. To guess type the number or the name of the color.'
    guess = gets_guess
    until validate_guess(guess)
      puts 'Invalid guess! Type the number or color separated by white space. Example: 1 5 2 4'
      guess = gets_guess
    end
    guess
  end

  private

  def gets_guess
    guess = gets.chomp.split
    guess.map do |item|
      if item.ord.between?(48, 57)
        i = item.to_i - 1
        PEGS[i]
      else
        item
      end
    end
  end

  def validate_guess(guess)
    return invalid_size unless guess.length == CODE_LENGTH

    guess.each do |item|
      return invalid_number if item.nil?
      return invalid_color(item) unless PEGS.include?(item)
    end

    true
  end

  def invalid_size
    puts "\nThe code has #{CODE_LENGTH.length} colors!"
    false
  end

  def invalid_number
    puts "Type numbers between 1 and #{PEGS.length}."
    false
  end

  def invalid_color(item)
    puts "\n#{item} is invalid!"
    false
  end
end
