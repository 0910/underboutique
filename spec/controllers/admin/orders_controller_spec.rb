require 'spec_helper'

describe Admin::OrdersController do
render_views

it "shows the index page" do
  sign_in create(:admin_user)
  get :new
  response.should be_ok
end

it "creates a new order" do
  sign_in create(:admin_user)
  post :create, order: attributes_for(:order, :with_products, :full)
  response.should be_redirect
end

end
