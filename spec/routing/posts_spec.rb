require 'spec_helper'

describe PostsController do
  it 'matches all categories on a blog' do
    { :get => "/posts/bikes/" }.
      should route_to(controller: 'posts', action: 'by_blog', blog: 'bikes')
  end
  
  it 'matches a specific category' do
    { :get => "/posts/bikes/featured" }.
      should route_to(controller: 'posts', action: 'by_category', category: 'on_bikes_featured')
  end
  
  it 'does not match a blog with a category not in it' do
    { :get => "/posts/travel/featured" }.should_not be_routable
  end
end
