require 'spec_helper'

RSpec.describe CartItemsController, type: :controller do
  before do
    @current_order = CurrentOrder.new
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:order, user: @user)
    @order_item = FactoryGirl.create(:order_item, order: @order)
    @product = FactoryGirl.create(:product)
  end

  describe "POST 'create'" do
    it 'should increment cart item count' do
      session[:cart] = { @product.id.to_s => 10}
      post :create, { product_id: @product.id }
      expect(assigns(:cart).cart_data).to eq({"2"=>11})
      expect(response).to redirect_to(products_path)
    end
  end

  describe "POST 'update'" do
    it 'should increment cart item count' do
      session[:cart] = { @product.id.to_s => 10 }
      session[:order] = {"details"=>{"sub_total"=>"92.40", "total"=>92.4}, "items"=>{@product.id.to_s=>{"product"=>@product, "qty"=>11, "price"=>46.2}}}
      xhr :put, :update, { id: @product.id, cart_items: { product_id: @product.id.to_s, quantity: 11 }, order_details: {sub_total: 100.00, total: 110.00} }
      expect(assigns(:cart).cart_data).to eq({@product.id.to_s => 11})
      expect(JSON.parse(response.body)).to eq({"data"=>@product.id.to_s})
    end
  end
end