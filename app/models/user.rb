class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :current_cart
  has_many :orders

  def manage_current_cart(ordered_items)
  	cart = current_cart || create_current_cart
  	cart.update_attributes(cart_data: ordered_items)
  end

end
