require 'greeter'

describe Greeter do

  its(:say) { should eql("Hello World!") }
end
