class CreateSystemProducts < ActiveRecord::Migration
  def change
    create_table :system_products do |t|
      t.integer :system_id
      t.integer :product_id
      t.string :name
      t.timestamps null: false
    end
  end
end
