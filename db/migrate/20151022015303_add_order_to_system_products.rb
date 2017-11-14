class AddOrderToSystemProducts < ActiveRecord::Migration
  def change
    add_column :system_products, :order, :integer
  end
end
