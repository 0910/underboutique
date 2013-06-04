FactoryGirl.define do
  factory :product do
    name 'Super Ring'
    description 'A ring with stones in it, its a cool piece of jewelry'
    available true
    price 100.0
    designer

    factory :necklace do
      name 'Neck Lace'
      price 120.0
    end
  end
end
