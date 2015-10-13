module YellowCab
  module V1
    class Drivers < Grape::API
      desc 'Create a driver', {
        params: YellowCab::V1::Entities::Driver.documentation
      }
      resource :drivers do
        post do
          service = Services::Drivers::CreateService.new(car_plate: params[:car_plate], name: params[:name])
          if service.is_valid?
            present service.call, with: YellowCab::V1::Entities::Driver
          else
            error_response(message: service.errors, status: 422)
          end
        end
      end
    end
  end
end