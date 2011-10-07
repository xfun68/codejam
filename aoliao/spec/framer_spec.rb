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
  end
end
