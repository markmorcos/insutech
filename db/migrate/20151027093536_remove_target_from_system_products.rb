class RemoveTargetFromSystemProducts < ActiveRecord::Migration
  def change
    remove_column :system_products, :target, :string
  end
end
