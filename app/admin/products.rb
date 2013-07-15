require 'helpers'

ActiveAdmin.register Product do
  # Designers can only edit their products
  controller do
    def scoped_collection
      if current_admin_user.designer?
        current_admin_user.designer.products
      else
        Product
      end
    end
  end
  
  index do
    column :id
    column :name
    column :designer
    column :price do |product|
      number_to_currency product.price, unit: "$"
    end
    default_actions
  end
  
  show do |product|
    attributes_table_with_images do
      row :name
      row :price
      row :description
      row :sizes do 
        product.sizes.collect(&:to_label).join(', ')
      end
    end
  end
  
  form_with_images do |f|
    f.input :name, :label => "Nombre",as: :string
    f.input :price, :label => "Precio", as: :number
    f.input :description, :label => "Descripcion"
    f.input :type_of_product, :label => "Tipo de producto",:as => :select, :collection => ["Ropa", "Zapatos","Accesorios"], :include_blank => false
    if f.object.designer.nil?
      f.input :designer 
    end
    f.input :sizes, as: :check_boxes
  end
end
