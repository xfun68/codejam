require 'greeter'

describe Greeter do

  describe "#say" do
    subject { Greeter.new.say }

    it { should eql "Hello World!" }
  end
end

