class AddProductIdToSystemProducts < ActiveRecord::Migration
  def change
    add_column :system_products, :product_id, :integer
  end
end
