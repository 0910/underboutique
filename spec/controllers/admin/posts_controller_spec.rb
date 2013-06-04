require 'spec_helper'

describe Admin::PostsController do
render_views

it "creates a new post" do
  sign_in create(:admin_user)
  post :create, post: attributes_for(:post, :published, :video)
  response.should be_redirect
end

it "shows the edit page including the option for adding images" do
  sign_in create(:admin_user)
  item = create(:post, :published)
  get :edit, id: item.id
  response.should be_ok
end

end
