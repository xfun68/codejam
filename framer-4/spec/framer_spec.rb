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

    context "when strings has multiple lines" do
      context "given lines are in the same length" do
        let(:strings) { ["foo", "bar"] }
        it { should eql([ "+---+",
                          "|foo|",
                          "|bar|",
                          "+---+" ]) }
      end

      context "given lines are in the different length" do
        let(:strings) { ["I", "am", "a", "multiple", "lines", "string"] }
        it { should eql([ "+--------+",
                          "|I       |",
                          "|am      |",
                          "|a       |",
                          "|multiple|",
                          "|lines   |",
                          "|string  |",
                          "+--------+" ]) }
      end
    end
  end
end

