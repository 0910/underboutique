require 'helpers'

ActiveAdmin.register Order do
  # Designers can only edit their products
  controller do
    def scoped_collection
      if current_admin_user.designer?
        current_admin_user.designer.orders
      else
        Order
      end
    end
  end

  index do
    column :code, sortable: false
    column :name
    column :email
    column :created_at
    column :amount do |order|
      number_to_currency order.amount, unit: "$"
    end
    column :items do |order|
      order.products.size
    end
    column :paid_on
    column :shipped_on
    column :canceled_on
    default_actions
  end
  
  show do |order|
    attributes_table do
      row :name
      row :email
      row :amount do
        number_to_currency order.amount, unit: "$"
      end
      row :paid_on
      row :shipped_on
      row :canceled_on
      row 'items' do
        ul do
          order.order_products.each do |item|
            li "#{item.quantity} x \"#{item.product.name}\""
          end
        end
      end
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs("Order Details") do
      f.input :name, as: :string
      f.input :email, as: :email
      f.input :country, as: :string
      f.input :province, as: :string
      f.input :city, as: :string
      f.input :postal_code, as: :string
      f.input :address, input_html: {rows: 3}
      f.input :amount
      f.input :paid_on, as: :datepicker
      f.input :shipped_on, as: :datepicker
      f.input :canceled_on, as: :datepicker
    end

    f.has_many :order_products do |fi|
      fi.inputs "Item details" do
        fi.input :product
        fi.input :quantity
        fi.input :order
        fi.input :_destroy, :as => :boolean, :label => "Destroy?"
      end
    end
    
    f.actions
  end
end
