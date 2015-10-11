FactoryGirl.define do
  factory :driver do
    name { Faker::Name.name }
    car_plate { "#{('A'..'Z').to_a.shuffle[0,3].join}-#{rand(9999).to_s.rjust(4, '0')}" }
    available { [true, false].sample }
  end
end