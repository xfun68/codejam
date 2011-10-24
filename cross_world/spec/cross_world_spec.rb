require_relative '../lib/cross_world'

describe CrossWorld do

  describe "#display" do
    subject { CrossWorld.new.display(map) }

    context "given one signle wall block" do
      let(:map) { ["x"] }
      it { should eql([ "#####",
                        "#####",
                        "#####",
                        "#####" ]) }
    end

    context "given one signle road block" do
      let(:map) { ["_"] }
      it { should eql([ "#####",
                        "#   #",
                        "#   #",
                        "#####" ]) }
    end

    context "given two blocks in one row" do
      let(:map) { ["x_"] }
      it { should eql([ "#########",
                        "#####   #",
                        "#####   #",
                        "#########" ]) }
    end

    context "given four blocks in tow row and two columns" do
      let(:map) { [ "x_",
                    "__"] }
      it { should eql([ "#########",
                        "#####   #",
                        "#####   #",
                        "#########",
                        "#   #   #",
                        "#   #   #",
                        "#########" ]) }
    end
  end
end

