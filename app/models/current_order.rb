class CurrentOrder
  attr_accessor :ordered_items
  attr_accessor :total
  attr_accessor :final_amount

  def initialize(current_order={})
    @ordered_items = current_order["items"] || {}
    current_order["details"] ||= {}
    @total = current_order["details"]["total"] || 0
    @final_amount = current_order["details"]["final_amount"] || 0
    @user = {}
    @transaction_id = ""
    @status = "pending"
  end

  # update order data
  def update_order(order, args)
    @ordered_items = order["items"] || {}
    @total = order["details"]["total"] || 0
    @transaction_id = args[:transaction_id] || ""
    @status = args[:status] || "pending"
  end

  # Save user current cart items
  def save_order(current_user)
    user = current_user
    new_order = user.orders.new(total: @final_amount, transaction_id: @transaction_id, status: @status)
    save_successful = new_order.save
    if save_successful
      @ordered_items.each do |index, details|
        new_order.order_items <<
          OrderItem.create(product_id: details["product"]["id"],
                           quantity: details["qty"])
      end
    end
    save_successful
  end

end
