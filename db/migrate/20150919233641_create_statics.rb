class CreateStatics < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      Static.create!(key: "about_us_text", value: "")
      Static.create!(key: "about_us_image", value: "")
      Static.create!(key: "about_app_text", value: "")
      Static.create!(key: "about_app_image", value: "")
      Static.create!(key: "contact_first_address", value: "")
      Static.create!(key: "contact_first_email", value: "")
      Static.create!(key: "contact_second_email", value: "")
      Static.create!(key: "contact_third_email", value: "")
      Static.create!(key: "contact_number", value: "")
      Static.create!(key: "terms_and_conditions", value: "")
      Static.create!(key: "contact_second_address", value: "")
      Static.create!(key: "we_design_text", value: "")
    end
  end
  
  def change
    create_table :statics do |t|
      t.string :key
      t.text :value
      t.string :attachment
      t.timestamps null: false
    end
  end
end
