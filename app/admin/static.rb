ActiveAdmin.register Static do
  permit_params :value, :attachment
  
  config.sort_order = "key_asc"

  form do |f|
    f.inputs static.key do
      f.input :value, as: :wysihtml5
      f.input :attachment
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :key
      row :value do
        static.value.html_safe
      end
      row :attachment
    end
    active_admin_comments
  end
  
  index do
    column :key
    actions
  end
end
