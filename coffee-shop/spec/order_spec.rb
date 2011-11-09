require 'order'

describe Order do

  describe "#order" do

    context "given only a cup of coffee" do
      order = Order.new
      subject { order }
      order.add_item("HomeBlend", 0.89)
      its(:total_price) { should eql(0.89) }
    end

    context "given only a cup of coffee and some sorces" do
      order = Order.new
      subject { order }
      order.add_item("HomeBlend", 0.89)
      order.add_item("milk", 0.10)
      order.add_item("soy", 0.15)
      order.add_item("milk", 0.10)
      its(:total_price) { should eql(1.24) }
    end
  end

  describe "#print" do
    it "prints a list for ordered coffee and sorces with total price" do
      order = Order.new
      order.add_item("HomeBlend", 0.89)
      order.add_item("milk", 0.10)
      order.add_item("soy", 0.15)
      order.add_item("milk", 0.10)
      order.list.should eql([ "HomeBlend 1 0.89",
                              "milk 2 0.20",
                              "soy 1 0.15",
                              "total 1.24" ])
    end
  end
end

