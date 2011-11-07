require 'greeter'

describe Greeter do

  describe "#say" do
    its(:say) { should eql("Hello World!") }
  end
end

