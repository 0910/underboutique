require 'spec_helper'

describe OrdersController do
  it 'shows the checkout form and the cart items' do
    page.set_rack_session(new_cart_with_items.session)
    
    visit new_order_path
    page.should have_selector('h1')
    page.should have_selector('form')
  end
  
  it 'fills in and submits the form' do
    page.set_rack_session(new_cart_with_items.session)
    
    visit new_order_path
    fill_in 'order_name', with: 'coco'
    fill_in 'order_email', with: 'coco@email.com'
    fill_in 'order_country', with: 'Argentina'
    fill_in 'order_province', with: 'Buenos Aires'
    fill_in 'order_city', with: 'Buenos Aires'
    fill_in 'order_postal_code', with: 'BLA8393'
    fill_in 'order_address', with: 'Cordoba 5110'
    find('#order_submit_action button[type=submit]').click
    
    page.should have_content('Tu orden fue enviada')
  end
end
