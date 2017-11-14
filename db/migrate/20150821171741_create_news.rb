class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :title_ar
      t.string :image
      t.text :description
      t.text :description_ar
      t.timestamps null: false
    end
  end
end
