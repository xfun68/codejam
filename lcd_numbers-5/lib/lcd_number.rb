class LCDNumber
  DIGITS = [
    [ " - ",
      "| |",
      "   ",
      "| |",
      " - " ],
    [ "   ",
      "  |",
      "   ",
      "  |",
      "   " ],
    [ " - ",
      "  |",
      " - ",
      "|  ",
      " - " ],
    [ " - ",
      "  |",
      " - ",
      "  |",
      " - " ],
    [ "   ",
      "| |",
      " - ",
      "  |",
      "   " ],
    [ " - ",
      "|  ",
      " - ",
      "  |",
      " - " ],
    [ " - ",
      "|  ",
      " - ",
      "| |",
      " - " ],
    [ " - ",
      "  |",
      "   ",
      "  |",
      "   " ],
    [ " - ",
      "| |",
      " - ",
      "| |",
      " - " ],
    [ " - ",
      "| |",
      " - ",
      "  |",
      " - " ]
  ]

  def display(numbers)
    @numbers = numbers
    transform_to_digits
    joined_digits
  end

  private

  def transform_to_digits
    @digits = @numbers.chars.map do |char|
      DIGITS[char.to_i]
    end
  end

  def joined_digits
    (0...@digits.first.size).map do |line_number|
      @digits.inject("") do |line, digit|
        line += digit[line_number]
      end
    end
  end
end

