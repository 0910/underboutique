require 'spec_helper'

describe Product do
  it 'default product is valid' do
    build(:product).should be_valid
  end

  it 'needs a name' do
    build(:product, name: nil).should_not be_valid
  end
  
  it 'needs a numeric price' do
    build(:product, price: 'fafafa').should_not be_valid
  end

  it 'has several sizes' do
    product = create(:product)
    product.sizes << Size.create(label: 'Small', order: 1)
    product.save!
    product.sizes.size.should == 1
  end
end
