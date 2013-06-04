require 'spec_helper'

describe AdminUser do
  it 'can be an admin' do
    user = create(:admin_user)
    user.role.should == 'admin'
    user.should be_admin
    user.should_not be_designer
    user.should_not be_guest
  end

  it 'can be a designer' do
    user = create(:designer_user)
    user.role.should == 'designer'
    user.should_not be_admin
    user.should be_designer
    user.should_not be_guest
    user.designer.should be_a Designer
  end
    
  it 'can be a guest' do
    user = AdminUser.new
    user.role.should be_nil
    user.should_not be_admin
    user.should_not be_designer
    user.should be_guest
  end
end
