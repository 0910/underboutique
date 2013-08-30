class AddProductsToCollection < ActiveRecord::Migration
  def change
  	change_table :products do |t|
  		t.references :collection
  	end
  end
end
