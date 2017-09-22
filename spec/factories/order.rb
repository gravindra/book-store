FactoryGirl.define do
  factory :order, class: Order do
    status 'created'
    total 0
    user
    transaction_id SecureRandom.hex(8)
  end

  factory :pending_order, parent: :order do
    status 'pending'
  end

  factory :completed_order, parent: :order do
    status 'completed'
  end
end