#encoding: utf-8
require "helpers"

ActiveAdmin.register Comprador do
  menu :label => 'Comprador'
  
  # The designer can only edit himself, so there's no point in having a list of designers
  # to choose from.
  before_filter proc{
    redirect_to(action: :edit, id: current_admin_user.designer.id) if current_admin_user.designer?
  }, only: :index
  
  index do
    column :name
    column :name_tarjeta
    default_actions
  end
  
  show do
    attributes_table do
      row :name
      row :telefono
      row :direccion
      row :mail
      row :name_tarjeta
    end
  end

  form do |f|
    f.inputs :name => "Campos de información" do
      f.input :name, as: :string, :label => "Nombre y Apellido"
      f.input :telefono
      f.input :direccion
      f.input :mail
    end
    f.inputs :name => "Datos de la tarjeta" do
      f.input :name_tarjeta, as: :string, :label => "Nombre y apellido tal cual figura en la tarjeta"
      f.input :numero_tarjeta
      f.input :marca_tarjeta
      f.input :vencimiento_tarjeta
      f.input :codigo_tarjeta
    end
    f.buttons 
  end
end
