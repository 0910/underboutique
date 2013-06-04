require 'spec_helper'

describe PostsController do
  render_views
  it 'shows all posts for a given blog' do
    @one = create(:post, on_bikes_featured: true)
    @two = create(:post, on_bikes_watch_this: true)
    create(:post, on_travel_remote: true)

    get :by_blog, blog: 'bikes'
    response.should be_ok
    assigns(:posts).should == [@one, @two]
    assigns(:list_name).should == "bikes"
  end
  
  it 'shows all posts for a category' do
    @one = create(:post, on_bikes_featured: true)
    create(:post, on_bikes_watch_this: true)
    get :by_category, category: 'on_bikes_featured'
    response.should be_ok
    assigns(:posts).should == [@one]
    assigns(:list_name).should == "bikes/featured"
  end
end
