class CurrentCart < ActiveRecord::Base

  serialize :cart_data, Hash
  belongs_to :user

  def cart_hash
    cart = {}
    cart_data["items"].each do |product_id, details|
      cart[product_id] = details["qty"]
    end
    cart
  end
end
