FactoryGirl.define do
  factory :post do
    title 'Bikes and more bikes'
    body 'Oh man I love bikes and jewelry so much I had to write it here'
    layout 'photos'
    
    trait :published do
      on_bikes_featured true
      published_at Date.today
    end
    
    trait :video do
      layout 'video'
      video_url 'rocking.com'
    end
    
  end
end
