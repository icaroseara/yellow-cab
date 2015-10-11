FactoryGirl.define do
  factory :driver_status do
    location [ Faker::Address.latitude, Faker::Address.longitude]
    driver { create(:driver) }
  end
end