class CreateMerchant < ActiveRecord::Migration[5.1]
  def change
    create_table :merchant do |t|
      t.string :name, :address
      t.timestamps null: false
    end
  end
end
