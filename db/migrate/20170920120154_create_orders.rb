class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.float :total
      t.references :user, index: true, foreign_key: true
      t.string :transaction_id

      t.timestamps null: false
    end
  end
end
