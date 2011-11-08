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
  end
end

