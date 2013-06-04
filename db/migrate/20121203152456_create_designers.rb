class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.text :name, null:false
      t.text :bio
      t.timestamps
    end
  end
end
