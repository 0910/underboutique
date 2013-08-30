require 'helpers'

ActiveAdmin.register Collection do
  controller do
    def scoped_collection
      if current_admin_user.designer?
        current_admin_user.designer.collections
      else
        Collection
      end
    end
  end

  index do
    column :id
    column :title
    default_actions
  end
  
  show do |collection|
    attributes_table_with_images do
      row :title
      row :description
    end
  end
  
  form_with_images do |f|
    f.input :title, :label => "Titulo",as: :string
    f.input :description, :label => "Descripcion"
  end
end
