ActiveAdmin.register System do
  permit_params :system_id, :full_name, :name, :image_2d, :image_3d, system_products_attributes: [:id, :system_id, :product_id, :target, :name, :created_at, :updated_at, :_destroy]

  config.sort_order = "name_asc"

  scope :systems, default: true do |systems|
    systems.where("image_2d <> ''")
  end
  
  scope :all do |systems|
    systems.all
  end
  
  index do
    selectable_column
    id_column
    column :full_name
    column :name
    column :image_2d do |f|
      image_tag f.image_2d.thumb
    end
    column :image_3d do |f|
      image_tag f.image_3d.thumb
    end
    column :created_at
    column :updated_at
    actions
  end
  
  form do |f|
    f.semantic_errors
    f.inputs :system do
      f.input :system_id, as: :select, collection: System.all.map{ |s| [s.to_s, s.id]}
      f.input :name
      f.input :full_name
      f.input :image_2d
      f.input :image_3d
    end
    f.inputs "Products" do
      f.has_many :system_products, sortable: :order do |s|
        s.input :name
        s.input :target, as: :select, collection: ["Membrane", "Emulsion", "Thermal Insulation"]
        # s.input :product
        s.input :_destroy, as: :boolean
      end
    end
    f.actions
  end

  show do
    if resource.system_products.any?
      panel "System Products" do
        system_products = []
        resource.system_products.each do |system_product|
          if system_product.target != ""
            system_products << "<strong>" + system_product.name + "</strong>"
          else
            system_products << system_product.name
          end
        end
        system_products.join("<br>").html_safe
      end
    end
    default_main_content
  end
end
