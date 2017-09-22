module CartsHelper

  def track_product_price_change(product_id, current_price)
    if current_user && current_user.current_cart.present?
      cart_product = current_user.current_cart.cart_data["items"][product_id.to_s]
      if cart_product
        cart_price = cart_product["price"]
        if current_price != cart_price
          "<p class='text-danger'>Product price updated from #{cart_price}$ to #{current_price}$</p>".html_safe
        end
      end
    end
  end

  def line_item_total(price, qty)
    "#{(price * qty.to_i).round(2)}$"
  end
end
