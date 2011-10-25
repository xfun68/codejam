require_relative '../lib/block'

class CrossWorld

  def initialize(blocks)
    @blocks = blocks
  end

  def show_map(data)
    build_map_from(data)
    to_a
  end

  private

  def build_map_from(data)
    @map = data.collect do |row_data|
      row_data.chars.collect do |block_data|
        @blocks[block_data.to_sym]
      end
    end
  end

  def to_a
    @map.inject(Block.new([])) do |result, row|
      row_block = row.inject(Block.new([])) do |memo, block|
        memo.merge_horizentally(block, :left => 1)
      end
      result.merge_vertically(row_block, :above => 1)
    end.to_a
  end
end

