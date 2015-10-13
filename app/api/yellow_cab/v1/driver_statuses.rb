module YellowCab
  module V1
    class DriverStatuses < Grape::API
      resource :drivers do
        desc 'Update current position and availability of a driver', {
          params: YellowCab::V1::Entities::DriverStatus.documentation
        }
        route_param :id do
          resource :status do
            post do
              service = Services::DriverStatuses::UpdateService.new(lat: params[:lat].to_f,
                                                                    lng: params[:lng].to_f,
                                                                    driver_id: params[:id],
                                                                    available: params[:available])
              if service.is_valid?
                present service.call, with: YellowCab::V1::Entities::DriverStatus
              else
                error_response(message: service.errors, status: 422)
              end
            end
          end
        end
        
        desc 'List of active drivers within a specific area.', {
          params: YellowCab::V1::Entities::DriverStatusQuery.documentation
        }
        get do
          sw = params[:sw].split(",").map(&:to_f).reverse
          ne = params[:ne].split(",").map(&:to_f).reverse
          driver_statuses = DriverStatus.in_area(sw, ne)
          present driver_statuses, with: YellowCab::V1::Entities::DriverStatus
        end
        
        desc 'Get driver status', {
          params: YellowCab::V1::Entities::DriverStatus.documentation
        }
        route_param :id do
          resource :status do
            get do
              driver_status = DriverStatus.where(driver_id: params[:id])
              if driver_status.present?
                present driver_status.take, with: YellowCab::V1::Entities::DriverStatus
              else
                error_response(message: "Not Found", status: 404)
              end
            end
          end
        end
      end
    end
  end
end