class CrossWorld
  BLOCK_MAPPINGS = {
    "x" => [
      "#####",
      "#####",
      "#####",
      "#####"
    ],
    "_" => [
      "#####",
      "#   #",
      "#   #",
      "#####"
    ]
  }
  BLOCK_LINE_COUNT = BLOCK_MAPPINGS["x"].size

  def display(map_str)
    tranform_to_matrix(map_str)
    join_blocks_in_row
    remove_duplicated_row
  end

  private

  def tranform_to_matrix(map_str)
    @matrix = map_str.collect do |row|
      row.chars.collect do |c|
        BLOCK_MAPPINGS[c]
      end
    end
  end

  def join_blocks_in_row
    @matrix = @matrix.collect do |row|
      (0...BLOCK_MAPPINGS["x"].size).collect do |index|
        row.collect { |block| block[index] }.join("&").sub(/&#/, "")
      end
    end.flatten
  end

  def remove_duplicated_row
    result = []
    @matrix.each_with_index do |row, index|
      result << row if ((0 != (index % BLOCK_LINE_COUNT)) || (0 == index))
    end
    result
  end
end

