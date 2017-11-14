class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :country
      t.string :phone
      t.string :company_name
      t.timestamps null: false
    end
  end
end
