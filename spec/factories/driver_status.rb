FactoryGirl.define do
  factory :driver_status do
    location [[80.24958300000003, 13.060422],[-66.50758935729877,81.79959172550289],[113.79216358593311,15.128574223088748]].sample
    available { [true, false].sample }
    driver { create(:driver) }
  end
end