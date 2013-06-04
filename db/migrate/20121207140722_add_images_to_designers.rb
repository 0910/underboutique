class AddImagesToDesigners < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.references :designer
    end
  end
  
  def down
    remove_column :images, :designer_id
  end
end
