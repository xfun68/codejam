class Greeter

  def greet
    "Hello World!"
  end
end

describe Greeter do

  describe "#greet" do
    subject { Greeter.new.greet }
    it { should eql("Hello World!") }
  end
end
