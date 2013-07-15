class AddCompradorIdUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :comprador_id, :integer
  end
end
