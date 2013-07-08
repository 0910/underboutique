class ChangeInfoDesigner < ActiveRecord::Migration
  def change
  	change_column :designers, :nombre, :string
  	change_column :designers, :direccion, :string
  	change_column :designers, :telefono, :string
  	change_column :designers, :horario_entrega, :string
  	change_column :designers, :situacion_fiscal, :string
  end
end
