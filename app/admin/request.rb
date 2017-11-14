ActiveAdmin.register Request do
  permit_params :customer_id, :product_id, :surface_finish, :request_type
  
  scope :datasheets do |requests|
    requests.where(request_type: "Datasheet")
  end
  
  scope :designs do |requests|
    requests.where(request_type: "Design")
  end
  
  form do |f|
    f.inputs :request do
      f.input :customer
      f.input :product
      f.input :surface_finish
      f.input :request_type, as: :select, collection: ["Datasheet", "Design"]
    end
    f.actions
  end
  
  index do
    selectable_column
    id_column
    column :customer
    column :product
    column :surface_finish
    column :request_type
    column :created_at
    column :updated_at
    actions
  end
end
