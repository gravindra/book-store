module ApplicationHelper

  def cart_properties
    cart_properties = {}
    if session[:cart].nil? || session[:cart].empty?
      cart_properties["items_count"] = 0;
    else
      cart_properties["items_count"] = items_in_cart;
    end
    cart_properties
  end

  def items_in_cart
    items = 0
    if !session[:cart].nil? && session[:cart].length > 0
      # session[:cart].each do |key, value|
      #   items += value
      # end
      items = session[:cart].keys.count
    end
    items
  end
end
