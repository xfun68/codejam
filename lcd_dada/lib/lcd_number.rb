class LCD
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
        " - " ],
    ]

  def display(numbers, scale = 1)
    digits = convert_to_digits(numbers)
    horizentally_scaled_digits = digits.map do |digit|
      digit.map do |line|
        elemets = line.split(//)
        elemets[0] + elemets[1] * scale + elemets[2]
      end
    end
    scaled_digits = horizentally_scaled_digits.map do |digit|
      digit[3..3] *= scale
      digit[1..1] *= scale
      digit
    end
    join_each_digit(scaled_digits)
  end

  private

  def convert_to_digits(numbers)
    numbers.chars.map {|char| DIGITS[char.to_i]}
  end

  def join_each_digit(digits)
    line_count = digits.first.size
    (0...line_count).map do |line_number|
      digits.inject("") { |memo, digit| memo += digit[line_number] }
    end
  end
end

