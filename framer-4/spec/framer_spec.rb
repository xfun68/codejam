require 'framer'

describe Framer do

  describe "#decorate" do
    subject { Framer.new.decorate(strings) }

    context "when strings is empty" do
      let(:strings) { "" }
      it { should eql([ "++",
                        "++" ]) }
    end

    context "when strings has a single line" do
      let(:strings) { "foo" }
      it { should eql([ "+---+",
                        "|foo|",
                        "+---+" ]) }
    end
  end
end

