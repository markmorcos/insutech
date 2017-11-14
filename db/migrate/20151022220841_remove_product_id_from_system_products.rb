class RemoveProductIdFromSystemProducts < ActiveRecord::Migration
  def change
    remove_column :system_products, :product_id, :integer
  end
end
