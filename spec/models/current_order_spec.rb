require 'spec_helper'
describe 'CurrentOrder' do
  describe '#methods' do
    before do
      @current_order = CurrentOrder.new
      @user = FactoryGirl.create(:user)
      @order = FactoryGirl.create(:order, user: @user)
      @order_item = FactoryGirl.create(:order_item, order: @order)
      @product = FactoryGirl.create(:product)
    end

    describe 'initialize' do
      it 'should initialize the base class with the provided argument' do
        current_order = CurrentOrder.new({"details"=>{"total"=>180.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}})
        expect(current_order.final_amount).to eq(0)
        expect(current_order.ordered_items).to eq({"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}})
        expect(current_order.total).to eq(180.0)
      end

      it 'should initialize the base class without the provided argument' do
        expect(@current_order.final_amount).to eq(0)
        expect(@current_order.ordered_items).to eq({})
        expect(@current_order.total).to eq(0)
      end
    end

    describe '#update_order' do
      it 'should update order' do
        current_order = CurrentOrder.new({"details"=>{"total"=>180.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}})

        current_order.update_order({"details"=>{"total"=>190.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}},{})
        expect(current_order.final_amount).to eq(0)
        expect(current_order.ordered_items).to eq({"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}})
        expect(current_order.total).to eq(190.0)
      end

      it 'should not update order' do
        current_order = CurrentOrder.new({"details"=>{"total"=>180.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}})
        current_order.update_order({"details"=>{"total"=>180.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}}, {})
        expect(current_order.final_amount).to eq(0)
        expect(current_order.ordered_items).to eq({"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}})
        expect(current_order.total).to eq(180.0)
      end
    end

    describe '#save_order' do

      it 'should save order successfully' do
       current_order = CurrentOrder.new({"details"=>{"total"=>180.0}, "items"=>{"1"=>{"product"=>{"id"=>1, "name"=>"Learn RoR - Beginner"}}}})
        expect(current_order.save_order(@user)).to eq(true)
      end

      it 'should not save order successfully' do
        allow_any_instance_of(Order).to receive(:save).and_return(false)
        expect(@current_order.save_order(@user)).to eq(false)
      end
    end
  end
end