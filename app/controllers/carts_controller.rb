class CartsController < ApplicationController

	def index
    @cart_items = session[:cart]
    @ordered_products = {}
    @total = 0
    unless session[:cart].nil?
      @cart_items.each do |product_id, qty|
        product = Product.find_by_id(product_id)
        @ordered_products[product_id] = { product: product, qty: qty, price: product.price }
        @total += (product.price * qty)
      end
    end

    # @current_order.ordered_items = @ordered_products
    session[:order]["details"]["total"] = @total
    session[:order]["items"] = @ordered_products
  end

  def destroy
    product_id = params[:id]
    @cart.cart_data.delete(product_id)

    redirect_to carts_path
  end
end
