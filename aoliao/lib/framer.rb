class Framer

  def decorate(*strings)
    self.text = strings
    @text.map { |row| decorate_row(row) }.unshift(header).push(footer)
  end

  private

  def text=(strings)
    strings.delete("")
    @text = strings.flatten.compact
    @width = @text.collect { |row| row.size }.max || 0
  end

  def decorate_row(string)
    "|" + string.ljust(@width) + "|"
  end

  def header
    footer
  end

  def footer
    "+" + "-" * @width + "+"
  end
end

