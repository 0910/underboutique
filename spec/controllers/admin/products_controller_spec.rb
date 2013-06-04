require 'spec_helper'

describe Admin::ProductsController do
  render_views

  describe 'when logged in as an admin' do
    it "shows the index nice and easy" do
      create(:product)
      create(:product, name: 'a necklace')
      sign_in create(:admin_user)
      get :index
      response.should be_ok
    end

    it "shows the new page" do
      sign_in create(:admin_user)
      get :new
      response.should be_ok
    end

    it "shows a product" do
      sign_in create(:admin_user)
      get :show, id: create(:product).id
      response.should be_ok
    end
    
    it "creates a product with a designer" do
    end 
  end
  
  describe 'when logged in as a designer' do
    it 'assigns the currently logged in designer to the product when creating' do
      post :create, product: attributes_for(:product)
      response.should be_ok
      assigns(:product).designer.should == designer
    end
  end
end
