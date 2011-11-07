require 'aoliao'

describe Box do

  describe "#width #rows" do
    subject { Box.new(text) }

    context "given empty text" do
      let(:text) { "" }
      its(:width) { should eql(0) }
      its(:rows) { should have(0).items }
    end

    context "given a single character" do
      let(:text) { "C" }
      its(:width) { should eql(1) }
      its(:rows) { should have(1).items }
    end

    context "given a string" do
      let(:text) { "String" }
      its(:width) { should eql(6) }
      its(:rows) { should have(1).items }
    end

    context "given two strings" do
      context "in array format" do
        let(:text) { ["Two", "Strings"] }
        its(:width) { should eql(7) }
        its(:rows) { should have(2).items }
      end
      context "in separated parameters" do
        subject { Box.new("Two", "Strings") }
        its(:width) { should eql(7) }
        its(:rows) { should have(2).items }
      end
    end

    context "given multiple strings" do
      context "including empty ones" do
        let(:text) { ["Strings", "With", "", "Empty", "Ones", ""] }
        its(:width) { should eql(7) }
        its(:rows) { should have(4).items }
      end
      context "including nil ones" do
        let(:text) { ["Strings", "With", nil, "Empty", "Ones", ""] }
        its(:width) { should eql(7) }
        its(:rows) { should have(4).items }
      end
    end
  end

  describe "#equal?" do
    let(:left) { Box.new(left_text) }
    let(:right) { Box.new(right_text) }

    context "given the same one" do
      let(:left_text) { "Foo" }
      let(:right_text) { "Foo" }
      subject { left == right }
      it { should be_true }
    end

    context "given the different one" do
      let(:left_text) { "Foo" }
      let(:right_text) { "Bar" }
      subject { left == right }
      it { should be_false }
    end
  end

  describe "#spread" do
    let(:box) { Box.new("A") }
    subject { box.spread(opts) }

    context "given only new width" do
      let(:opts) { {:width => 10} }
      its(:width) { should eql(10) }
    end

    context "given only new height" do
      let(:opts) { {:height => 10} }
      its(:height) { should eql(10) }
    end

    context "given only both new height && new width" do
      let(:opts) { {:height => 10, :width => 10} }
      its(:height) { should eql(10) }
      its(:width) { should eql(10) }
    end
  end

  describe "#| add horizontally" do
    let(:left) { Box.new(left_text) }
    let(:right) { Box.new(right_text) }

    context "when the box size is same" do
      let(:left_text) { ["123", "Foo"] }
      let(:right_text) { ["456", "Bar"] }
      subject { left | (right) }
      it { should equal Box.new(
        "123456",
        "FooBar") }
    end

    context "when only the box height is same" do
      let(:left_text) { ["123456", "Foo"] }
      let(:right_text) { ["7890", "Bar"] }
      subject { left | (right) }
      it { should equal Box.new(
        "1234567890",
        "Foo   Bar ") }
    end

    context "when only the box width is same" do
      let(:left_text) { ["12345", "Foo"] }
      let(:right_text) { ["67890", "Bar", "Done"] }
      subject { left | (right) }
      it { should equal Box.new(
        "1234567890",
        "Foo  Bar  ",
        "     Done ") }
    end

    context "when both the box width are different" do
      let(:left_text) { ["12345", "Foo"] }
      let(:right_text) { ["67890abcdef", "Bar", "Done"] }
      subject { left | (right) }
      it { should equal Box.new(
        "1234567890abcdef",
        "Foo  Bar        ",
        "     Done       ") }
    end
  end

  describe "# - add vertically" do
    let(:up) { Box.new(up_text) }
    let(:down) { Box.new(down_text) }

    context "when the box size is same" do
      let(:up_text) { ["123", "Foo"] }
      let(:down_text) { ["Bar", "123"] }
      subject { up - (down) }
      it { should equal Box.new(
        "123",
        "Foo",
        "Bar",
        "123") }
    end

    context "when only the box height is same" do
      let(:up_text) { ["123456", "Foo"] }
      let(:down_text) { ["Bar", "7890"] }
      subject { up - (down) }
      it { should equal Box.new(
        "123456",
        "Foo   ",
        "Bar   ",
        "7890  ") }
    end

    context "when only the box width is same" do
      let(:up_text) { ["12345", "Foo"] }
      let(:down_text) { ["Bar", "67890", "Done"] }
      subject { up - (down) }
      it { should equal Box.new(
        "12345",
        "Foo  ",
        "Bar  ",
        "67890",
        "Done ") }
    end

    context "when both the box width are different" do
      let(:up_text) { ["12345", "Foo"] }
      let(:down_text) { ["Bar", "67890abcdef", "Done"] }
      subject { up - (down) }
      it { should equal Box.new(
        "12345      ",
        "Foo        ",
        "Bar        ",
        "67890abcdef",
        "Done       ") }
    end
  end
end

