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
    f.inputs :name => "Datos de la marca" do
      f.input :name, as: :string, :label => "Nombre de la marca"
      f.input :bio
    end
    
    f.inputs :name => "Datos administrativos" do
      f.input :nombre
      f.input :direccion, :label => "Dirección"
      f.input :telefono, :label => "Teléfono"
      f.input :cuit, :label => "CUIT / CUIL", hint: "Por ejemplo: CUIT 20-22333444-6"
      f.input :horario_entrega, :label => "Horarios de entrega", hint: "Por ejemplo 10 a 18."
      f.input :situacion_fiscal, :label => "Situación fiscal", hint: "Situación fiscal (monotributo o resp inscr, etc)."
    end
  end
end
