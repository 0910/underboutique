class AddInfoDesigner < ActiveRecord::Migration
  def change
  	add_column :designers, :nombre, :text
  	add_column :designers, :direccion, :text
  	add_column :designers, :telefono, :text
  	add_column :designers, :cuit, :integer
  	add_column :designers, :horario_entrega, :text
  	add_column :designers, :situacion_fiscal, :text
  end
end
