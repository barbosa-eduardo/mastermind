class Code
  CODE_LENGTH = 4
  VALID_DIGITS = %w[1 2 3 4 5 6]

  def valid?(code)
    return false unless code.length == CODE_LENGTH

    code.split.each do |char|
      return false unless VALID_DIGITS.include?(char)
    end

    true
  end
end
