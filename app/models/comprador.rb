class Comprador < ActiveRecord::Base
  validates :name, presence: true 
  attr_accessible :name, :telefono, :direccion, :mail, :mail, :name_tarjeta, :marca_tarjeta, :vencimiento_tarjeta, :codigo_tarjeta, :numero_tarjeta, as: [:admin, :default]
end
