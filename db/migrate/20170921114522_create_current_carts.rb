class CreateCurrentCarts < ActiveRecord::Migration
  def change
    create_table :current_carts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :cart_data

      t.timestamps null: false
    end
  end
end
