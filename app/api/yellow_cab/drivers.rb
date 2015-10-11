module YellowCab
  class Drivers < Grape::API
    desc 'Return a list of drivers'
    resource :drivers do
      get do
        Driver.all
      end
    end
  end
end