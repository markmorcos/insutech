class AddTargetToSystemProducts < ActiveRecord::Migration
  def change
    add_column :system_products, :target, :string
  end
end
