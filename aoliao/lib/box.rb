class Box

  def initialize(*strings)
    @text = strings.flatten.compact
    @text.delete("")
  end

  def to_a
    @text
  end

  def width
    @text.map { |line| line.length }.max || 0
  end
end

