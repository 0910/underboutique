require 'spec_helper'

describe 'DesignerAuth' do
  it 'signs up with email, password and a designer name' do
    visit new_admin_user_registration_path
    fill_in 'Email', with: 'designer@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Brand Name', with: 'My Shop'
    click_button 'Sign up'
  end
end
