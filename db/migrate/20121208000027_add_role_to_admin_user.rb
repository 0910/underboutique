class AddRoleToAdminUser < ActiveRecord::Migration
  def up
    add_column :admin_users, :role, :string
    add_column :admin_users, :designer_id, :integer
    AdminUser.update_all(role: 'admin')
  end
  
  def down
    remove_column :admin_users, :role
    remove_column :admin_users, :designer_id
  end
end
