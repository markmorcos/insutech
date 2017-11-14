class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :system_id
      t.string :name
      t.string :name_ar
      t.string :image
      t.string :category
      t.string :first_level
      t.string :second_level
      t.string :cold_flexibility
      t.string :carrier
      t.text :description
      t.text :description_ar
      t.string :datasheet
      t.timestamps null: false
    end
  end
end
