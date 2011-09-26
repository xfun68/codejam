require 'framer'

describe Framer do

  let(:framer) { Framer.new }

  describe "#decorate" do
    subject { framer.decorate(data) }

    context "given single character" do
      expected = (<<-EOF
+-+
|C|
+-+
EOF
      ).split("\n")
      let(:data) { "C" }
      it { should eql expected }
    end

    context "given a string with length more than 2" do
      expected = (<<-EOF
+------+
|String|
+------+
EOF
      ).split("\n")
      let(:data) { "String" }
      it { should eql expected }
    end

    context "given two strings" do
      expected = (<<-EOF
+------+
|String|
|Foo   |
+------+
EOF
      ).split("\n")
      let(:data) { ["String", "Foo"] }
      subject { framer.decorate(data) }
      it { should eql expected }
    end

    context "given an empty string" do
      expected = (<<-EOF
++
++
EOF
      ).split("\n")
      let(:data) { "" }
      it { should eql expected }
    end

    context "given a nil parameter" do
      expected = (
      <<-EOF
++
++
EOF
      ).split("\n")
      let(:data) { nil }
      it { should eql expected }
    end
  end

end

