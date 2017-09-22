FactoryGirl.define do
  factory :order_item, class: OrderItem do
    product
    order
    quantity 1
  end
end