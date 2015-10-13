class API < Grape::API
  include YellowCab::V1::Defaults
  
  prefix :api
  default_format :json
  version 'v1', using: :header, vendor: 'yellow-cab'
  
  default_error_status 400
  
  mount YellowCab::V1::Drivers
  mount YellowCab::V1::DriverStatuses  
end
