require 'spec_helper'

RSpec.describe CheckoutController, type: :controller do

  describe 'logged in' do
    before do
      @user = FactoryGirl.create(:user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @product = FactoryGirl.create(:product)
      @current_order = FactoryGirl.create(:current_cart, user: @user,  cart_data: {"items" => []})
      sign_in @user
    end

    describe "GET 'show' " do
      it 'returns http success' do
        get :show
        expect(response).to be_success
      end

      it 'should render show page' do
        get :show
        expect(response).to render_template('show')
      end
    end

    describe "POST 'create' " do
      before do
        @checkout_params = { payment_status: 'completed' , txn_id: '125' }
      end

      it 'create redirects on success' do
        post :create, @checkout_params
        expect(response).to redirect_to(root_path)
      end

      it 'creates sets flash on success' do
        post :create, @checkout_params
        expect(flash[:success]).to eq("Your order has been successfully placed.")
      end

    end
  end
end