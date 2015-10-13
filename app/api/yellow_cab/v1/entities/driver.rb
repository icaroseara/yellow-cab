module YellowCab
  module V1
    module Entities
      class Driver < Grape::Entity
        expose :id, documentation: { type: "String", desc: "Driver ID." } do |driver|
          driver.id.to_s
        end
        expose :name, documentation: { type: "String", desc: "Driver name." }
        expose :car_plate, documentation: { type: "String", desc: "Car plate." }
      end
    end
  end
end