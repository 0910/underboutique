class Designer < ActiveRecord::Base
  has_many :images
  has_many :products
  has_many :orders
  validates :name, presence: true 
  attr_accessible :name, :bio, :images_attributes, as: [:admin, :default]
  attr_accessible :enabled, as: :admin
  accepts_nested_attributes_for :images, allow_destroy: true
end
