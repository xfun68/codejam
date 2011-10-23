class LCD
  DIGITS = [
    [ " - ", "| |", "   ", "| |", " - " ],
    [ "   ", "  |", "   ", "  |", "   " ],
    [ " - ", "  |", " - ", "|  ", " - " ],
    [ " - ", "  |", " - ", "  |", " - " ],
    [ "   ", "| |", " - ", "  |", "   " ],
    [ " - ", "|  ", " - ", "  |", " - " ],
    [ " - ", "|  ", " - ", "| |", " - " ],
    [ " - ", "  |", "   ", "  |", "   " ],
    [ " - ", "| |", " - ", "| |", " - " ],
    [ " - ", "| |", " - ", "  |", " - " ],
  ]

  def display(numbers)
    @digits = numbers.chars.map do |number|
      DIGITS[number.to_i]
    end
    (0...@digits.first.size).map do |index|
      @digits.map do |digit|
        digit[index]
      end.join
    end
  end
end

