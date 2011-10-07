require 'framer'

describe Framer do

  describe "#decorate" do
    subject { Framer.new.decorate(text) }

    context "given an empty string" do
      let(:text) { "" }
      it { should eql ["++", "++"] }
    end

    context "given a single character" do
      let(:text) { "C" }
      it { should eql ["+-+", "|C|", "+-+"] }
    end

    context "given a one line string" do
      let(:text) { "String" }
      it { should eql ["+------+", "|String|", "+------+"] }
    end

    context "given multiline string" do
      let(:text) { ["Two", "Strings"] }
      it { should eql ["+-------+", "|Two    |", "|Strings|", "+-------+"] }
    end

    context "given nil value" do
      let(:text) { [nil, "String"] }
      it { should eql ["+------+", "|String|", "+------+"] }
    end

    context "given without any argument" do
      subject { Framer.new.decorate() }
      it { should eql ["++", "++"] }
    end
  end
end
