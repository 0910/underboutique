require 'spec_helper'

describe HomeController do 
  it 'shows product items' do
    product = create(:product)
    visit root_path
    page.should have_selector('img')
    page.should have_content product.name
    find('.btn').click
    #save_and_open_page
  end
end