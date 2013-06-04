require 'spec_helper'

describe HomeController do
  render_views
  
	it 'shows the index with products' do
		one = create(:product)
		two = create(:necklace)
		get :index
		assigns(:products).should == [one, two] 
	end
end
