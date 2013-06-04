class OrderProduct < ActiveRecord::Base
  attr_accessible :product, :order_id, :size, :product_id, :quantity, as: [:admin, :default]
  belongs_to :product
  belongs_to :order
  validates :product, presence: true
end
