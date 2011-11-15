class LCDNumber

  def display(numbers)
    [
      [ " - ",
        "| |",
        "   ",
        "| |",
        " - " ],
      [ "   ",
        "  |",
        "   ",
        "  |",
        "   " ]
    ][numbers.to_i]
  end
end

