ActiveAdmin.register Product do
  permit_params :name, :name_ar, :image, :category, :first_level, :second_level, :cold_flexibility, :carrier,
                :description, :description_ar, :datasheet
  
  form do |f|
    f.inputs :product do
      f.input :name
      f.input :name_ar
      f.input :image
      f.input :category, as: :select, collection: ["Waterproofing", "Thermal Insulation"]
      f.input :first_level, as: :select, collection: ["Membrane", "Emulsion", "XPS", "EPS"]
      f.input :second_level, as: :select, collection: ["APP", "SBS", "WB", "RB"]
      f.input :cold_flexibility, as: :select, collection: ["0 to -4", "-3 to -6", "-5 to -8", "-8 to -12", "-10 to -12", "-12 to -15", "-15 to -18", "-18 to -22", "-22 to -25"]
      f.input :carrier, as: :select, collection: ["Polyester", "Fiberglass"]
      f.input :description, as: :wysihtml5
      f.input :description_ar, as: :wysihtml5
      f.input :datasheet
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
