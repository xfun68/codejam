class Framer

  def decorate(*strings)
    @text = strings.flatten
    [header, text_with_side_border, footer].flatten
  end

  private

  def header
    "+" + "-" * width + "+"
  end

  def footer
    header
  end

  def width
    @text.map { |line| line.length }.max || 0
  end

  def text_with_side_border
    @text.map do |line|
      "|#{line}|" unless line.empty?
    end.compact
  end
end

