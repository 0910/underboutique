require 'spec_helper'

describe Cart do
  it 'creates an empty cart' do
    new_empty_cart.should be_empty
  end
  
  it 'creates a cart with some items' do
    new_cart_with_items.should_not be_empty
  end

  it 'adds an item to the shopping cart' do
    cart = new_empty_cart
    product = create(:product)
    expect do
      cart.add(product.id, 12, '38').should be_true
      prod, quantity, size = cart.items.first
      prod.should == product
      quantity.should == 12
      size.should == '38'
    end.to change{ cart.items.size }.by(1)
  end
  
  it 'does not add item if product not found' do
    cart = new_empty_cart
    expect do
      cart.add('111', 1, '38').should be_false
    end.not_to change{ cart.items.size }
  end
  
  it 'does not add item if not available' do
    cart = new_empty_cart
    product = create(:product, available: false)
    expect do
      cart.add(product.id, 1, '44').should be_false
    end.not_to change{ cart.items.size }
  end
  
  it 'does not add item if invalid quantity' do
    cart = new_empty_cart
    product = create(:product)
    expect do
      cart.add(product.id, 'twitter', '44').should be_false
    end.not_to change{ cart.items.size }
  end
  
  it 'has products, quantities and sizes' do
    new_cart_with_items.items.all? do |product, quantity, size| 
      product.should be_a Product
      quantity.should be_an Integer
      size.should be_an String
    end.should be_true
  end
  
  it 'sums quantities when adding the same product twice' do
    cart = new_empty_cart
    product = create(:product)
    expect do
      cart.add(product.id, 10, '44')
      cart.add(product.id, 20, '44')
      prod, quantity, size = cart.items.first
      quantity.should == 30
      size.should == '44'
      prod.should == product
    end.to change{ cart.items.size }.by(1)
  end
  
  it 'does not sum quantities when adding different sizes of the same product' do
    cart = new_empty_cart
    product = create(:product)
    expect do
      cart.add(product.id, 10, '44')
      cart.add(product.id, 20, '20')
      prod, quantity, size = cart.items.first
      quantity.should == 10
      size.should == '44'
      prod.should == product
    end.to change{ cart.items.size }.by(2)
  end
  
  it 'removes an item from the cart' do
    cart = new_cart_with_items
    product, quantity, size = cart.items.first
    expect do
      cart.delete "#{product.id}_#{size}"
    end.to change{ cart.items.size }.by(-1)
  end
  
  it 'calculates the full amount' do
    new_cart_with_items.amount.should == 1100
    new_empty_cart.amount.should == 0
  end
  
  it 'clears the cart' do
    cart = new_cart_with_items
    cart.should_not be_empty
    cart.clear
    cart.should be_empty
    Cart.new(cart.session).should be_empty
  end
end
