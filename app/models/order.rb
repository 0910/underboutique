class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :designer
  attr_accessible :name, :email, :country, :province, :city,
    :postal_code, :address, as: [:default, :admin]
  attr_accessible :amount, :paid_on, :shipped_on, :canceled_on,
    :order_products_attributes, as: :admin
  accepts_nested_attributes_for :order_products, allow_destroy: true

  %w(designer name email country province city
  postal_code address amount order_products).each do |field|
    validates field.to_sym, presence: true
  end
  
  validates :amount, numericality: true, if: :amount
  validates :email, email: true, if: :email
  
  # Constructs a new order from a cart, copying the items in the cart session into
  # the newly created order.
  def self.from_cart(cart, params = {})
    orders = cart.items_by_designer.collect do |designer, items|
      order = new(params)
      items.each do |product, quantity, size|
        order.order_products.build product: product, quantity: quantity, size: size
      end
      order.amount = cart.amount_for_designer(designer)
      order.designer = designer
      order
    end
    orders.each(&:save) if orders.all?(&:valid?)
  end
  
  # Returns a nicely formatted order code
  def code
    "%05i" % id unless new_record?
  end
end
