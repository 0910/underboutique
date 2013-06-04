require 'spec_helper'

describe Admin::DesignersController do
  render_views
  
  it 'shows the index page' do
    create(:designer)
    sign_in create(:admin_user)
    get :index
    response.should be_ok
  end

  it 'create a new designer with images' do
    sign_in create(:admin_user)
    post :create, designer: attributes_for(:designer, :with_images)
    response.should be_redirect
  end
  
  it 'shows a designer' do
    sign_in create(:admin_user)
    get :show, id: create(:designer, :with_images).id
    response.should be_ok
  end
  
  it 'does not let a designer change their enabled flag' do
    designer_user = create(:designer_user)
    sign_in designer_user
    expect do
      post :update, id: designer_user.designer.id,
        designer: attributes_for(:designer, enabled: true)
    end.to raise_exception(ActiveModel::MassAssignmentSecurity::Error)
    designer_user.reload.designer.should_not be_enabled
  end
  
  it 'lets admin users change a designers enabled flag' do
    designer_user = create(:designer_user)
    sign_in create(:admin_user)
    post :update, id: designer_user.designer.id,
      designer: attributes_for(:designer, enabled: true)
    response.should be_redirect
    designer_user.reload.designer.should be_enabled
  end
end
