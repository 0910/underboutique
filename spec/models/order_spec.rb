require 'spec_helper'

describe Order do
  it { should belong_to :designer }
  %w(designer name email country province city postal_code address amount order_products).each do |field|
    it "validates presence of #{field}" do
      order = Order.new
      order.valid?
      order.should have(1).error_on(field.to_sym)
    end
  end
  
  %w(paid_on shipped_on canceled_on amount).each do |field|
    it "cannot mass assign #{field}" do
      expect{ Order.new field.to_sym => 'value' }
        .to raise_exception(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  it 'validates amount to be numeric' do
    order = Order.new
    order.amount = 'blabla'
    order.should_not be_valid
    order.should have(1).error_on(:amount)
  end
  
  it 'adds products when building from a shopping cart' do
    cart = new_cart_with_items
    order = Order.from_cart(cart)
    order.amount.should == cart.amount
    order.should_not be_valid
    order.order_products.collect do |order_product|
      [order_product.product, order_product.quantity, order_product.size]
    end.should == cart.items
  end
  
  it 'builds an order from a shopping cart and optional params' do
    cart = new_cart_with_items
    order = Order.from_cart(cart.items.first.first.designer, cart, attributes_for(:order))
    order.should be_valid
    order.save!
    order.products.should == [cart.items.first.first]
  end
  
  it 'gives you a nicely formatted order code' do
    order = create(:order, :with_products)
    order.code.should =~ /0{1,5}#{order.id}/
  end
  
  it 'does not have a nice code if the order is not saved yet' do
    build(:order, :with_products).code.should be_nil
  end
  
  it 'does not accept invalid email addresses' do
    order = build(:order, :with_products, email: 'jojojo lalala')
    order.should_not be_valid
    order.should have(1).errors_on(:email)
  end
end
