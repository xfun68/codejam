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
    digits = numbers.chars.map do |char|
      DIGITS[char.to_i]
    end
    (0...digits.first.size).map do |line_number|
      digits.inject("") do |line, digit|
        line += digit[line_number]
      end
    end
  end
end

