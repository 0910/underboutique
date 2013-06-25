#encoding: utf-8
require "helpers"

ActiveAdmin.register Designer do
  menu :label => 'Designer'
  
  # The designer can only edit himself, so there's no point in having a list of designers
  # to choose from.
  before_filter proc{
    redirect_to(action: :edit, id: current_admin_user.designer.id) if current_admin_user.designer?
  }, only: :index
  
  index do
    column :name
    column :bio
    default_actions
  end
  
  show do
    attributes_table_with_images do
      row :name
      row :bio
    end
  end

  form_with_images("Imágenes de portada") do |f|
    f.input :name, as: :string
    f.input :bio
  end
end
