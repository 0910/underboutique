FactoryGirl.define do
  factory :designer do
    name 'Nuevo'
    bio 'Lallala lalal laaljldsaj'
    
    trait :with_images do
      images_attributes {
        {"0" => {"file" =>
          Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/photo.jpg'), 'image/png')
        }}
      }
    end
    
    trait :with_products do
      after :create do |designer, _|
        designer.products << FactoryGirl.create(:product)
        designer.save!
      end
    end
  end  
end
