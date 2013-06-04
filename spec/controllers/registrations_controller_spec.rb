# encoding: utf-8
require 'spec_helper'

describe RegistrationsController do
  render_views

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:admin_user]
  end
  
  it 'shows the registration form correctly' do
    get :new
    response.should be_ok
  end

  it 'registration always creates disabled designer user' do
    post :create, admin_user: {
      email: 'designer@example.com',
      password: 'password',
      password_confirmation: 'password'
    }, designer: { name: 'A designer' }
    response.should redirect_to admin_root_path
    admin = assigns(:admin_user)
    admin.should be_an AdminUser
    admin.should be_designer
    admin.designer.should be_a Designer
    admin.designer.name.should == 'A designer'
    admin.designer.should be_persisted
    admin.designer.should_not be_enabled
  end
  
  it 'does not let you create a user passing in a role' do
    expect do
      post :create, admin_user: {
        email: 'designer@example.com',
        password: 'password',
        password_confirmation: 'password',
        role: 'admin'
      }
    end.to raise_exception(ActiveModel::MassAssignmentSecurity::Error)
  end
end
