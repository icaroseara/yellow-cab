class Driver
  include Mongoid::Document
  field :name, type: String
  field :car_plate, type: String
end
