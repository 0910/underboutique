class CreateComprador < ActiveRecord::Migration
  def change
    create_table :comprador do |t|
      t.string :name
      t.string :telefono
      t.string :direccion
      t.string :mail
      t.string :name_tarjeta
      t.string :numero_tarjeta
      t.string :marca_tarjeta
      t.string :vencimiento_tarjeta
      t.integer :codigo_tarjeta
    end
  end
end
