class Driver
  include Mongoid::Document
  
  has_many :driver_statuses
  
  field :name, type: String
  field :car_plate, type: String
  field :available, type: Boolean,  default: true
  
  validates_presence_of :name, :car_plate, :available
  validates :car_plate, format: { with: /\A[A-Z]{3}\-\d{4}\z/ }
end
