require 'framer'

describe Framer do

  describe "#decorate" do
    subject { Framer.new.decorate(strings) }

    context "when strings is empty" do
      let(:strings) { "" }
      it { should eql(["++", "++"]) }
    end
  end
end

