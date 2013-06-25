class Product < ActiveRecord::Base
  has_many :images
  belongs_to :designer
  validates :name, presence: true
  validates :price, numericality: true
  validates :designer, presence: true
  attr_accessible :name, :price, :description,:type_of_product, :images_attributes, :size_ids, as: [:default, :admin]
  attr_accessible :designer_id, as: :admin
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :product_sizes
  has_many :sizes, through: :product_sizes
end

