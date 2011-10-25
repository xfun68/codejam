require_relative '../lib/cross_world'

wall_block = Block.new([ "#####",
                         "#####",
                         "#####",
                         "#####" ])

road_block = Block.new([ "#####",
                         "#   #",
                         "#   #",
                         "#####" ])

BLOCKS = { :x => wall_block, :o => road_block }

describe CrossWorld do
  let(:cw) { CrossWorld.new(BLOCKS) }

  describe "#show_map" do
    subject { cw.show_map(data) }

    context "given a single wall block" do
      let(:data) { ["x"] }
      it { should eql([ "#####",
                        "#####",
                        "#####",
                        "#####" ]) }
    end

    context "given a single road block" do
      let(:data) { ["o"] }
      it { should eql([ "#####",
                        "#   #",
                        "#   #",
                        "#####" ]) }
    end

    context "given multiple blocks in one row" do
      let(:data) { ["xo"] }
      it { should eql([ "#########",
                        "#####   #",
                        "#####   #",
                        "#########" ]) }
    end

    context "given multiple blocks in one column" do
      let(:data) { ["x", "o"] }
      it { should eql([ "#####",
                        "#####",
                        "#####",
                        "#####",
                        "#   #",
                        "#   #",
                        "#####" ]) }
    end
  end
end

