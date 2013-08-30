class AddSaleProducts < ActiveRecord::Migration
  def change
  	add_column :products, :sale, :boolean
  	add_column :products, :sale_price, :integer
  end
end
