require 'spec_helper'

describe Designer do
  it 'needs a name' do
    designer = Designer.new
    designer.should_not be_valid
  end  

  it 'add designer with images' do
    designer = build(:designer, :with_images)
    designer.should be_valid
    designer.save!
    designer.reload
    designer.images.should_not be_empty
  end
  
  it 'has products' do
    designer = create(:designer, :with_products)
    designer.reload
    designer.products.should_not be_empty
    designer.products.first.designer.should == designer
  end
end
