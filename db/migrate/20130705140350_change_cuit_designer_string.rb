class ChangeCuitDesignerString < ActiveRecord::Migration
  def change
  	change_column :designers, :cuit, :string
  end
end
