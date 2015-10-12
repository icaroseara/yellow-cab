class Driver
  include Mongoid::Document
  
  has_many :driver_statuses
  
  field :name, type: String
  field :car_plate, type: String
  
  validates_presence_of :name, :car_plate
  validates_uniqueness_of :car_plate
  validates :car_plate, format: { with: /\A[A-Z]{3}\-\d{4}\z/ }
end
