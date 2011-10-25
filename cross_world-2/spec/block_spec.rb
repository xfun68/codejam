require_relative '../lib/block'

describe Block do

  describe "#to_a" do
    subject { Block.new(matrix).to_a }

    context "when just created" do
      context "given no param" do
        expected = []
        let(:matrix) { expected }
        it { should eql(expected) }
      end

      context "given a matrix" do
        expected = [ "#####",
                     "#   #",
                     "#   #",
                     "#####" ]
        let(:matrix) { expected }
        it { should eql(expected) }
      end
    end
  end

  describe "#merge_horizentally" do
    let(:block_left) { Block.new(data_left) }
    let(:block_right) { Block.new(data_right) }

    context "when don't overwrite border" do
      subject { block_left.merge_horizentally(block_right) }

      context "given two empty matrix" do
        let(:data_left) { [] }
        let(:data_right) { [] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql([]) }
      end

      context "given left one is empty matrix" do
        let(:data_left) { [] }
        let(:data_right) { ["Foo", "Bar"] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo", "Bar"]) }
      end

      context "given right one is empty matrix" do
        let(:data_left) { ["Foo", "Bar"] }
        let(:data_right) { [] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo", "Bar"]) }
      end

      context "given both are non empty matrix" do
        let(:data_left) { ["Foo", "World"] }
        let(:data_right) { ["Hello", "Bar"] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo  Hello", "WorldBar  "]) }
      end
    end

    context "when overwrite borders" do
      subject { block_left.merge_horizentally(block_right, options) }

      context "when cutting off one column border of left block" do
        let(:data_left) { ["Foo", "World"] }
        let(:data_right) { ["Hello", "Bar"] }
        let(:options) { {:left => 1} }
        its(:to_a) { should eql(["Foo Hello", "WorlBar  "]) }
      end

      context "when cutting off one column border of right block" do
        let(:data_left) { ["Hello", "Bar"] }
        let(:data_right) { ["Foo", "World"] }
        let(:options) { {:right => 1} }
        its(:to_a) { should eql(["Hellooo  ", "Bar  orld"]) }
      end
    end
  end

  describe "#merge_vertically" do
    let(:block_above) { Block.new(data_above) }
    let(:block_below) { Block.new(data_below) }

    context "when don't overwrite border" do
      subject { block_above.merge_vertically(block_below) }

      context "given two empty matrix" do
        let(:data_above) { [] }
        let(:data_below) { [] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql([]) }
      end

      context "given above one is empty matrix" do
        let(:data_above) { [] }
        let(:data_below) { ["Foo", "Bar"] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo", "Bar"]) }
      end

      context "given below one is empty matrix" do
        let(:data_above) { ["Foo", "Bar"] }
        let(:data_below) { [] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo", "Bar"]) }
      end

      context "given both are non empty matrix" do
        let(:data_above) { ["Foo", "World"] }
        let(:data_below) { ["Hello", "Bar"] }
        it { should be_a_kind_of(Block) }
        its(:to_a) { should eql(["Foo", "World", "Hello", "Bar"]) }
      end
    end

    context "when overwrite borders" do
      subject { block_above.merge_vertically(block_below, options) }

      context "when cutting off one column border of above block" do
        let(:data_above) { ["Foo", "World"] }
        let(:data_below) { ["Hello", "Bar"] }
        let(:options) { {:above => 1} }
        its(:to_a) { should eql(["Foo", "Hello", "Bar"]) }
      end

      context "when cutting off one column border of below block" do
        let(:data_above) { ["Hello", "Bar"] }
        let(:data_below) { ["Foo", "World"] }
        let(:options) { {:below => 1} }
        its(:to_a) { should eql(["Hello", "Bar", "World"]) }
      end
    end
  end
end

