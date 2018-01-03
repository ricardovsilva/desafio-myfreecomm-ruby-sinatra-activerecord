class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :product do |t|
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
