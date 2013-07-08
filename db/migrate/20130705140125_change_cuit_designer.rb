class ChangeCuitDesigner < ActiveRecord::Migration
  def change
  	change_column :designers, :cuit, :text
  end
end
