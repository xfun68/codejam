require_relative '../lib/cross_world'

describe CrossWorld do

  describe "#show_map" do
    subject { CrossWorld.new.show_map(data) }

    context "given a single wall block" do
      let(:data) { ["x"] }
      it { should eql([ "#####",
                        "#####",
                        "#####",
                        "#####" ]) }
    end

    context "given a single road block" do
      let(:data) { ["_"] }
      it { should eql([ "#####",
                        "#   #",
                        "#   #",
                        "#####" ]) }
    end
  end
end

