require 'framer'

describe Framer do

  describe "#decorate" do
    subject { Framer.new.decorate(text) }

    context "when text is empty" do
      let(:text) { "" }
      expected = [
        "++",
        "++"
      ]
      it { should eql(expected) }
    end

    context "when text only has a single line" do
      let(:text) { "foo" }
      expected = [
        "+---+",
        "|foo|",
        "+---+"
      ]
      it { should eql(expected) }
    end

    context "when text has multiple lines in same length" do
      let(:text) { ["foo", "bar"] }
      expected = [
        "+---+",
        "|foo|",
        "|bar|",
        "+---+"
      ]
      it { should eql(expected) }
    end

    context "when text has multiple lines in different length" do
      let(:text) { ["I", "am", "a", "multiple", "string"] }
      expected = [
        "+--------+",
        "|I       |",
        "|am      |",
        "|a       |",
        "|multiple|",
        "|string  |",
        "+--------+"
      ]
      it { should eql(expected) }
    end
  end
end

