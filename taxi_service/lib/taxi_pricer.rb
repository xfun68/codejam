class TaxiPricer

  def initialize(distance, time)
    @distance = distance
    @time = time
  end

  def pay_list
    [ "Distance:  #{@distance} Km",
      "Ext Fee:   #{ext_fee} Yuan",
      "Total:     #{total_price} Yuan",
      "Time:      #{@time}" ]
  end

  def total_price
    startup_price + ext_fee + payed_distance * unit_price
  end

  private

  def startup_price
    day_running ? 6 : 7
  end

  def ext_fee
    1
  end

  def payed_distance
    (@distance <= 2) ? 0 : @distance - 2
  end

  def unit_price
    day_running ? 1.5 : 2.0
  end

  def day_running
    (6...22).include?(@time)
  end
end

