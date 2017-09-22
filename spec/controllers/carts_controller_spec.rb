require 'spec_helper'

RSpec.describe CartsController, type: :controller do
  before do
    @current_order = CurrentOrder.new
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:order, user: @user)
    @order_item = FactoryGirl.create(:order_item, order: @order)
    @product = FactoryGirl.create(:product)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it 'should render index page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should return 0 when no product in cart' do
      session[:cart] = nil
      get :index
      expect(assigns(:total)).to eq(0)
      expect(assigns(:ordered_products)).to eq({})
    end

    it 'should update total in session and ordered items' do
      session[:cart] = { @product.id.to_s => 10}
      get :index
      expect(assigns(:total)).to eq(100.0)
      expect(assigns(:ordered_products).keys).to eq([@product.id.to_s])
    end
  end

   describe "Delete 'destroy'" do
    it "cart count decreases" do
      session[:cart] = { @product.id.to_s => 10}
      delete :destroy, { id: @product.id }
      expect(assigns(:cart).cart_data).to eq({})
      expect(response).to redirect_to(carts_path)
    end
  end
end