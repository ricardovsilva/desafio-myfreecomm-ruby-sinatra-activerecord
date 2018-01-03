class CreateCustomer < ActiveRecord::Migration[5.1]
  def change
    create_table :customer do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
