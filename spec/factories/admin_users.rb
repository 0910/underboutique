FactoryGirl.define do
  factory :admin_user do
    email 'admin@example.com'
    password 'password'
    role 'admin'
  
    factory :designer_user do
      email 'designer@example.com'
      password 'password'
      role 'designer'
      designer
    end
  end
end
