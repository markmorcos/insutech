class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :customer_id
      t.integer :product_id
      t.string :request_type
      t.timestamps null: false
    end
  end
end
