require 'spec_helper'
describe 'Cart' do
  describe '#methods' do
    before do
      @product = FactoryGirl.create(:product)
      @cart_data = {@product.id => 1}
    end

    describe 'increment' do
      it 'should increment the product count' do
        cart = Cart.new(@cart_data)
        cart.increment(@product.id)
        expect(@cart_data).to eq({@product.id => 2})
      end

      it 'should add new product count' do
        cart = Cart.new(@cart_data)
        new_product = FactoryGirl.create(:product)
        cart.increment(new_product.id)
        expect(@cart_data).to eq({@product.id => 1, new_product.id => 1})
      end
    end
  end
end