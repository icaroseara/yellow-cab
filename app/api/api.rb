class API < Grape::API
  prefix :api
  format :json
  version 'v1', using: :header, vendor: 'yellow-cab'
  
  mount YellowCab::Drivers
end
