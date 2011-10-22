class LCDNumbers
  NUMBERS = [
    [ " - ",
      "| |",
      "   ",
      "| |",
      " - "],
    [ "   ",
      "  |",
      "   ",
      "  |",
      "   "],
    [ " - ",
      "  |",
      " - ",
      "|  ",
      " - "],
    [ " - ",
      "  |",
      " - ",
      "  |",
      " - "],
    [ "   ",
      "| |",
      " - ",
      "  |",
      "   "],
    [ " - ",
      "|  ",
      " - ",
      "  |",
      " - "],
    [ " - ",
      "|  ",
      " - ",
      "| |",
      " - "],
    [ " - ",
      "  |",
      "   ",
      "  |",
      "   "],
    [ " - ",
      "| |",
      " - ",
      "| |",
      " - "],
    [ " - ",
      "| |",
      " - ",
      "  |",
      " - "],
  ]

  def display(numbers)
    (0...NUMBERS[0].size).collect do |line_number|
      numbers.chars.collect do |number|
        NUMBERS[number.to_i][line_number]
      end.join
    end
  end
end

