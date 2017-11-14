ActiveAdmin.register News do
  permit_params :title, :title_ar, :image, :description, :description_ar

  form do |f|
    f.inputs :product do
      f.input :title
      f.input :title_ar
      f.input :image
      f.input :description, as: :wysihtml5
      f.input :description_ar, as: :wysihtml5
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :title
      row :title_ar
      row :image do
        image_tag news.image
      end
      row :description do
        news.description.html_safe
      end
      row :description_ar do
        news.description_ar.html_safe
      end
    end
    active_admin_comments
  end
  
  index do
    selectable_column
    id_column
    column :title
    column :title_ar
    actions
  end
end
