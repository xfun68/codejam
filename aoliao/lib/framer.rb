class Framer

  def decorate(*text)
    text = text.flatten
    width = text.collect { |row| row.size }.max
    result = []
    result << "+" + "-" * width + "+"
    text.each do |row|
      result << "|" + row.ljust(width) + "|" if row.size > 0
    end
    result << "+" + "-" * width + "+"
    result
  end
end
