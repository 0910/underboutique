require 'spec_helper'

describe DesignersController do
  render_views
  it 'shows the list designers' do
    one = create(:designer)
    get :index
    assigns(:designers).should == [one]
    response.should be_ok
  end

  it 'shows a designer' do
    one = create(:designer)
    get :show, id: one.id
    response.should be_ok
    assigns(:designer).should == one
  end
end