class Cart
  attr_reader :cart_data

  def initialize(cart_data)
    @cart_data = cart_data || {}
  end

  def increment(item_id)
    @cart_data[item_id] ||= 0
    @cart_data[item_id] += 1
  end

  def destroy
    @cart_data = nil
  end

  def delete
    @cart_data[item_id] = 0
  end

end
