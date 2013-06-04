FactoryGirl.define do
  factory :order do
    name 'Nubis'
    email 'an_email@example.com'
    country 'Argentina'
    province 'Buenos aires'
    city 'Buenos aires'
    postal_code 'blabal'
    address 'my address'
    designer
    
    trait :with_products do
      order_products_attributes do
        {"0" => {"product_id" => FactoryGirl.create(:product).id, "quantity" => 10}}
      end
      amount 11
    end

    trait :full do
      paid_on Date.today   
      shipped_on Date.today
      canceled_on Date.today
    end
  end
end
