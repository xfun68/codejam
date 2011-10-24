class CrossWorld
  BLOCKS = {
    :x => [ "#####",
            "#####",
            "#####",
            "#####" ],
    :_ => [ "#####",
            "#   #",
            "#   #",
            "#####" ]
  }

  def show_map(data)
    BLOCKS[data.first.to_sym]
  end
end

