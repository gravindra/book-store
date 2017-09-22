require 'spec_helper'

feature 'cart items', type: :request do
  before do
    @user = FactoryGirl.create(:user)
    @product_one = FactoryGirl.create(:product)
    # @product_two = FactoryGirl.create(:product)
    # @cart = FactoryGirl.create(:current_cart, cart_data: {@user.id => '1' })
  end

  scenario 'add item to cart' do
    visit products_path
    expect(page).to have_button('Add to cart')
    click_button('Add to cart')
    visit carts_path
    product_name = find("#product_name_#{@product_one.id}").text
    product_qty = find("#product_qty_#{@product_one.id} input.qty").value
    expect(product_name).to eq(@product_one.name)
  end
end