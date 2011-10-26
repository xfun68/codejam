require 'taxi_pricer'

describe TaxiPricer do
  let(:pricer) { TaxiPricer.new(distance, time) }

  describe "#total_price" do
    subject { pricer.total_price }

    context "when at the day" do
      context "when distance is less than QIBUJIA" do
        let(:distance) { 1 }
        let(:time) { 6 }
        it { should eql(7.0) }
      end

      context "when distance equals QIBUJIA" do
        let(:distance) { 2 }
        let(:time) { 12 }
        it { should eql(7.0) }
      end

      context "when distance is more than QIBUJIA" do
        let(:distance) { 3 }
        let(:time) { 21 }
        it { should eql(8.5) }
      end
    end

    context "when at the night" do
      context "when distance is less than QIBUJIA" do
        let(:distance) { 1 }
        let(:time) { 22 }
        it { should eql(8.0) }
      end

      context "when distance eqauls QIBUJIA" do
        let(:distance) { 2 }
        let(:time) { 0 }
        it { should eql(8.0) }
      end

      context "when distance is larger than QIBUJIA" do
        let(:distance) { 3 }
        let(:time) { 5 }
        it { should eql(10.0) }
      end
    end
  end

  describe "#pay_list" do
    let(:distance) { 3 }
    let(:time) { 5 }
    subject { pricer.pay_list }
    it { should eql([ "Distance:  3 Km",
                      "Ext Fee:   1 Yuan",
                      "Total:     10.0 Yuan",
                      "Time:      5"]) }
  end
end

