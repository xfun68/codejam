require 'framer'

describe Framer do

  describe "#decorate" do
    subject { Framer.new.decorate(text) }

    context "given an empty string" do
      let(:text) { "" }
      it { should eql ["++", "++"] }
    end
  end
end
