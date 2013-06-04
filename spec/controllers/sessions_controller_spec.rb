require 'spec_helper'

describe SessionsController do
  render_views

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:admin_user]
  end

  it 'redirects to admin dashboard on successful login' do
    create(:designer_user)
    post :create, admin_user: {email: 'designer@example.com', password: 'password'}
    response.should redirect_to(admin_root_path)
  end
end
