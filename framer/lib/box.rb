class Box

  def initialize *args
    @rows = args.flatten.compact
    @rows.delete("")
  end

  def width
    @rows.collect { |row| row.length }.max || 0
  end

  def height
    @rows.to_a.size
  end

  def append another_box
    result = []
    [height, another_box.height].max.times do |i|
      result << self.row(i).ljust(width) + another_box.row(i)
    end
    Box.new(result)
  end

  def shift another_box
    another_box.append self
  end

  def stack another_box
    # result = []                 # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # result << self.to_a         # result = self.to_a
    # result << another_box.to_a  # result << another_box.to_a
    result = [self, another_box].inject([]) do |total, element|
      total << element.to_a
    end.flatten
    Box.new(result)
  end

  def jack another_box
    another_box.stack self
  end

  def ljust
    rows = self.to_a.map { |row| row.ljust(self.width) }
    Box.new(rows)
  end

  def equal? another_box
    self.to_a == another_box.to_a
  end

  def to_a
    @rows
  end

  def row line_number
    @rows.fetch(line_number, "")
  end

end

