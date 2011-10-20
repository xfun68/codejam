require 'box'

describe Box do
  let(:box) { Box.new(strings) }

  describe "#to_a" do
    subject { box.to_a }

    context "when the string is empty" do
      let(:strings) { [""] }
      it { should eql([]) }
    end

    context "when the string is nil" do
      let(:strings) { nil }
      it { should eql([]) }
    end
  end

  describe "#width" do
    subject { box.width }

    context "when the string is NOT empth" do
      let(:strings) { "ABC" }
      it { should eql(3) }
    end

    context "when the string is empty" do
      let(:strings) { "" }
      it { should eql(0) }
    end
  end
end

