class DriverStatus
  include Mongoid::Document
  field :location, type: Array #[lng,lat]
  field :available, type: Boolean,  default: true
  
  validates_presence_of :location, :available
  
  index({location: "2d"})

  belongs_to :driver
  
  def lat
    location.last
  end
  
  def lng
    location.first
  end
end
