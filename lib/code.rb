# frozen_string_literal: true

# Contains the common information for CodeBreaker and CodeMaker
class Code
  CODE_LENGTH = 4
  VALID_DIGITS = %w[1 2 3 4 5 6].freeze

  def valid?(code)
    return false unless code.length == CODE_LENGTH

    code.chars.each do |char|
      return false unless VALID_DIGITS.include?(char)
    end

    true
  end
end
