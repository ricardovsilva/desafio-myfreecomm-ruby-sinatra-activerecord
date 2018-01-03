class CreatePurchase < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase do |t|
      t.integer :customer_id, :product_id, :merchant_id
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
