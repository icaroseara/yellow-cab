module YellowCab
  module V1
    module Entities
      class DriverStatus < Grape::Entity
        expose :driver_id, documentation: { type: "String", desc: "Driver ID." } do |driver_status|
          driver_status.driver_id.to_s
        end
        expose :lat, documentation: { type: "Float", desc: "Current location latitude." }
        expose :lng, documentation: { type: "Float", desc: "Current location longitude." }
        expose :available, documentation: { type: "Boolean", desc: "Driver availability." }
      end
      
      class DriverStatusQuery < Grape::Entity
        expose :sw, documentation: { type: "String", desc: "South and West points of the rectangle." }
        expose :ne, documentation: { type: "String", desc: "North and Eastern points of the rectangle." }
      end
    end
  end
end