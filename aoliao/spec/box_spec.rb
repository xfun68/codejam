require 'box'

describe Box do
  subject { Box.new(data) }

  describe "#attributes" do

    context "given a single character" do
      let(:data) { "C" }
      expected = (
      <<-EOF
      C
      EOF
      ).split
      its(:to_a) { should eql(expected) }
      its(:width) { should equal(1) }
      its(:height) { should equal(1) }
    end

    context "given a string" do
      let(:data) { "String" }
      expected = (
      <<-EOF
      String
      EOF
      ).split
      its(:to_a) { should eql(expected) }
      its(:width) { should equal(6) }
      its(:height) { should equal(1) }
    end

    context "given two strings in array format" do
      let(:data) { ["String", "HelloWorld!"] }
      expected = (
      <<-EOF
      String
      HelloWorld!
      EOF
      ).split
      its(:width) { should equal(11) }
      its(:height) { should equal(2) }
      its(:to_a) { should eql(expected) }
    end

    context "given empty string" do
      let(:data) { "" }
      expected = "".split
      its(:width) { should equal(0) }
      its(:height) { should equal(0) }
      its(:to_a) { should eql(expected) }
    end

    context "given nil parameter" do
      let(:data) { nil }
      expected = []
      its(:width) { should equal(0) }
      its(:height) { should equal(0) }
      its(:to_a) { should eql(expected) }
    end
  end

  describe "#just" do
    let(:box) { Box.new("A", "FooBar") }
    subject { box.ljust }
    it { should equal(Box.new("A     ", "FooBar")) }
  end

  describe "#operators" do
    let(:first_box) { Box.new("First", "FooBar") }
    let(:second_box) { Box.new("Second") }

    context "when append anoter box" do
      subject { first_box.append(second_box) }
      it { should equal(Box.new("FirstSecond", "FooBar")) }
    end

    context "when shift anoter box" do
      subject { first_box.shift(second_box) }
      it { should equal(Box.new("SecondFirst", "FooBar")) }
    end

    context "when stack anoter box" do
      subject { first_box.stack(second_box) }
      it { should equal(Box.new("First", "FooBar", "Second")) }
    end

    context "when jack anoter box" do
      subject { first_box.jack(second_box) }
      it { should equal(Box.new("Second", "First", "FooBar")) }
    end
  end

end
