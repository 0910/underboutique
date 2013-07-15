ActiveAdmin.register AdminUser do
  menu :if => proc{ can?(:manage, 'admin' ) }

  index do
    column :email
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, :collection => ['admin', 'designer', 'comprador'], :include_blank => false
    end
    f.buttons
  end
end
