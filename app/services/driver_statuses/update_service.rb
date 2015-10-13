module Services::DriverStatuses
  class UpdateService < Services::Base
    attr_accessor :lat, :lng, :driver_id, :available, :driver_status
    validates :lat, :lng, :driver_id, :available, presence: true

    def call
      driver_status.update_attributes(location: [lng,lat], available: available) if is_valid?
      driver_status
    end

    def is_valid?
      valid? ? driver_status_founded? : false
    end
    
    private 
    def driver_status_founded?
      @driver_status = DriverStatus.find_or_initialize_by(driver_id: driver_id)
      errors.add(:driver_id, :invalid) unless @driver_status.blank?
      @driver_status.present?
    end
  end
end