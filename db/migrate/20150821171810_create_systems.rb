class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :system_id
      t.string :name
      t.string :image_2d
      t.string :image_3d
      t.timestamps null: false
    end
  end
end
