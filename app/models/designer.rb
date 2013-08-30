class Designer < ActiveRecord::Base
  has_many :images
  has_many :products
  has_many :collections
  has_many :orders
  validates :name, presence: true 
  attr_accessible :name, :bio, :images_attributes, :nombre, :direccion, :telefono, :cuit, :horario_entrega, :situacion_fiscal, as: [:admin, :default]
  attr_accessible :enabled, as: :admin
  accepts_nested_attributes_for :images, allow_destroy: true
end
