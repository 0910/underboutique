class Image < ActiveRecord::Base
  attr_accessible :file, as: [:default, :admin]
  has_attached_file :file, :styles => {:small => '150x150>', :large => '1000x1000>'}
  validates_attachment :file, presence: true,
    content_type: { content_type: ['image/jpg', 'image/png', 'image/gif', 'image/jpeg'] }
  belongs_to :post
  belongs_to :product
end
