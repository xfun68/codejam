class RSpectGreeter
  def greet
    "Hello RSpec!"
  end
end

describe "RSpec Greeter" do
  it "should say 'Hello RSpec!' when it receives the greet() message" do
    greeter = RSpectGreeter.new
    greeting = greeter.greet
    greeting.should == "Hello RSpec!"
  end
end
