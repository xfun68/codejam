class Block
  attr_reader :width, :height

  def initialize(matrix)
    @matrix = matrix
    @width = @matrix.map { |line| line.length }.max || 0
    @height = @matrix.size
  end

  def to_a
    @matrix
  end

  def merge_horizentally(right_block, options = {})
    left_count = options.fetch(:left, 0)
    right_count = options.fetch(:right, 0)

    max_height = [self.height, right_block.height].max

    new_matrix = (0...max_height).inject([]) do |memo, index|
      left_part = self.to_a.fetch(index, "").ljust(self.width).split(//)[0..(-1-left_count)].join
      right_part = right_block.to_a.fetch(index, "").ljust(right_block.width).split(//)[right_count..-1].join
      memo << left_part + right_part
    end
    Block.new(new_matrix)
  end

  def merge_vertically(below_block, options = {})
    above_count = options.fetch(:above, 0)
    below_count = options.fetch(:below, 0)
    new_matrix = self.to_a[0..(-1-above_count)] + below_block.to_a[below_count..-1]
    Block.new(new_matrix)
  end
end

