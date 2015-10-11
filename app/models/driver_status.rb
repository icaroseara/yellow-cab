class DriverStatus
  include Mongoid::Document
  include Mongoid::Geospatial
  
  belongs_to :driver
  
  field :location, type: Point
    
  spatial_index :location 
end
