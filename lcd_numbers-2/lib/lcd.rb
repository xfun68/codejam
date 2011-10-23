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
    transform_to_digit(numbers)
    join_each_digit
  end

  private

  def transform_to_digit(numbers)
    @digits = numbers.chars.map do |number|
      DIGITS[number.to_i]
    end
  end

  def join_each_digit
    (0...@digits.first.size).map do |index|
      @digits.map do |digit|
        digit[index]
      end.join
    end
  end
end

