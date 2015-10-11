class DriverStatus
  include Mongoid::Document
  include Mongoid::Geospatial
  
  belongs_to :driver
  field :available, type: Boolean,  default: true
  field :location, type: Point
  
  spatial_index :location 
end
