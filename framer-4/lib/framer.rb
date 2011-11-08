class Framer

  def decorate(*strings)
    self.text = strings
    [header, text_with_side_border, footer].flatten
  end

  private

  def text=(strings)
    @text = strings.flatten.reject { |line| line.empty? }
  end

  def header
    "+" + "-" * width + "+"
  end

  def footer
    header
  end

  def text_with_side_border
    @text.map do |line|
      "|#{line.ljust(width)}|"
    end.compact
  end

  def width
    @text.map { |line| line.length }.max || 0
  end
end

