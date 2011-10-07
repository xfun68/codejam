class Framer

  def decorate(*strings)
    self.text = strings
    self.text.collect do |row|
      "|" + row.ljust(@width) + "|"
    end.unshift(header).push(footer)
  end

  def text
    @text
  end

  def text=(strings)
    strings.delete("")
    @text = strings.flatten.compact
    @width = @text.collect { |row| row.size }.max || 0
  end

  private

  def header
    footer
  end

  def footer
    "+" + "-" * @width + "+"
  end
end

