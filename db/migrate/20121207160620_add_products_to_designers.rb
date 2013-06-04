class AddProductsToDesigners < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.references :designer
    end
  end
  
  def down
    remove_column :products, :designer_id
  end
end
