require_relative '../lib/greeter'

describe Greeter do

  its(:say) { should eql("Hello World!") }
end
