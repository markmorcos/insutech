class AddFullNameToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :full_name, :text
  end
end
