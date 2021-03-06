class CartItemsController < ApplicationController

  def create
    @cart.increment(params[:product_id])
    session[:cart] = @cart.cart_data

    redirect_to products_path
  end

  def update
    cart = cart_params
    product_id = cart[:product_id]
    quantity = cart[:quantity]
    session[:cart][product_id] = quantity.to_i
    session[:order]["items"][product_id]["qty"] = quantity.to_i
		session[:order]["details"] = order_params

    render json: {data: product_id}
  end

  private

  def cart_params
		params.require(:cart_items).permit(:product_id, :quantity)
	end

	def order_params
		params.require(:order_details).permit(:sub_total, :total)
	end
end
