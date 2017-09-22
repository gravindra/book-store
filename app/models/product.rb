class Product < ActiveRecord::Base

	has_many :order_items
  has_many :orders, through: :order_items

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "default_image.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
