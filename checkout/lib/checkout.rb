class Checkout

  def initialize
    @goods = []
  end

  def total_price
    total = 0
    @goods.each do |item|
      total += {
        :A => 50
      }.fetch(item.to_sym, 0)
    end
    total
  end

  def scan(item)
    @goods << item
  end
end

