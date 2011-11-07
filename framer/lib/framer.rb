require_relative 'box'

class Framer

  def decorate(*args)
    box = Box.new(args).ljust
    @width, @height = box.width, box.height
    box = box.shift(left_border).append(right_border)
    box = box.jack(top_border).stack(bottom_border)
    box.to_a
  end

  private

  def top_border
    Box.new("+" + "-" * @width + "+")
  end

  def bottom_border
    top_border
  end

  def left_border
    Box.new(["|"] * @height)
  end

  def right_border
    left_border
  end

end

