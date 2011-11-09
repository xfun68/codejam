class Order

  def initialize
    @list = {}
  end

  def add_item(name, price)
    if @list.has_key? name
      @list[name][:count] += 1
    else
      @list[name] = {:price => price, :count => 1}
    end
  end

  def total_price
    @list.inject(0) do |total, item|
      total += (item[1][:price] * item[1][:count])
    end
  end

  def list
    result = @list.inject([]) do |memo, item|
      memo << "#{item[0]} #{item[1][:count]} #{"%0.2f" % (item[1][:price] * item[1][:count])}"
    end
    result << "total #{total_price}"
  end
end

