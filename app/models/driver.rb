class Driver
  include Mongoid::Document
  
  has_many :driver_statuses
  field :name, type: String
  field :car_plate, type: String
end
