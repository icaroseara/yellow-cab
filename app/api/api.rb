class API < Grape::API
  prefix 'api'
  format :json

  mount YellowCab::Drivers
end
