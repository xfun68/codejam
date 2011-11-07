class Box
  attr_reader :width, :height

  def initialize *text
    text = text.flatten.compact
    text.delete("")
    @height, @width = text.size, text.collect { |line| line.size }.max || 0
    @text = text.collect { |line| line.ljust(@width) }
  end

  def | (rhs)
    new_height = [self, rhs].collect { |box| box.height }.max
    left = self.spread(:height => new_height)
    right = rhs.spread(:height => new_height)
    result = []
    new_height.times { |i| result << left.rows[i] + right.rows[i] }
    Box.new(result)
  end

  def - (rhs)
    new_width = [self, rhs].collect { |box| box.width }.max
    up = self.spread(:width => new_width)
    down = rhs.spread(:width => new_width)
    Box.new([up.rows, down.rows])
  end

  def spread(opts={})
    new_width = opts.fetch(:width, self.width)
    new_height = opts.fetch(:height, self.height)
    text = []
    new_height.times { |i| text << self.rows.fetch(i, "").ljust(new_width) }
    Box.new(text)
  end

  def to_s
    rows.join("\n")
  end

  def rows
    @text
  end

  def equal? rhs
    self.rows == rhs.rows
  end

  def == rhs
    self.equal? rhs
  end
end

