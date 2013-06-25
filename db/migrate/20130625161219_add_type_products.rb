class AddTypeProducts < ActiveRecord::Migration
  def change
  	add_column :products, :type_of_product, :string
  end
 end
