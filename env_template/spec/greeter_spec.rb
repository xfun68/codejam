require_relative '../lib/greeter'

describe Greeter do

  it "says hello world" do
    Greeter.new.say.should eql("Hello World!")
  end
end

