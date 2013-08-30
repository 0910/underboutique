class Collection < ActiveRecord::Base
  has_many :images
  belongs_to :designer
  validates :title, presence: true
  attr_accessible :title, :description, :images_attributes, as: [:default, :admin]
  attr_accessible :designer_id, as: :admin
  accepts_nested_attributes_for :images, allow_destroy: true
end

