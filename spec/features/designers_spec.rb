#encoding: utf-8
require 'spec_helper'

describe DesignersController do
  it 'list all the designers' do
    3.times do
      create(:designer)
    end

    visit '/designers'
    page.should have_selector('div.designer', count: 3)
  end

  it 'shows a designer' do
    designer = create(:designer, :with_products)
    visit "/designers/#{designer.id}"
    page.should have_content designer.name
    page.should have_selector 'div.product'
    page.should have_selector 'div.images'
  end

  it 'select a designer and show' do
    designer = create(:designer)
    visit '/designers'
    find('.btn').click
    page.should have_content designer.name
  end
  
  describe 'when in Admin' do
    it 'adds a designer with images', js: true  do
      create(:admin_user)

      visit '/admin/designers/new'
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Login'
      click_link 'Add New Image'
      attach_file('File', Rails.root.join('spec/fixtures/images/photo.jpg'))
      fill_in 'Name', with: 'A designer'
      fill_in 'Bio', with: 'The bio for the designer'
      click_button 'Create Designer'
      page.should have_content 'Designer was successfully created.'
    end
    
  end
end
