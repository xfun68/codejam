require 'aoliao'

describe Framer do

  describe "#decorate" do
    let(:framer) { Framer.new }
    let(:text_box) { Box.new(text) }
    subject { framer.decorate(text_box) }

    context "given empty string" do
      let(:text) { "" }
      it { should equal Box.new(
        "++",
        "++") }
    end

    context "given single character" do
      let(:text) { "C" }
      it { should equal Box.new(
        "+-+",
        "|C|",
        "+-+") }
    end

    context "given a string" do
      let(:text) { "String" }
      it { should equal Box.new(
        "+------+",
        "|String|",
        "+------+") }
    end

    context "given two strings" do
      let(:text) { "Two Strings".split }
      it { should equal Box.new(
        "+-------+",
        "|Two    |",
        "|Strings|",
        "+-------+") }
    end

    context "given multiple strings including empty and nil one" do
      let(:text) { ["", "Foo", "String", "", nil] }
      it { should equal Box.new(
        "+------+",
        "|Foo   |",
        "|String|",
        "+------+") }
    end
  end
end
