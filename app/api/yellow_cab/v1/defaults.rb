module YellowCab
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        route :any, '*path' do
          error!
        end
        
        rescue_from ArgumentError do |e|
          error!("ArgumentError: #{e.message}")
        end

        rescue_from NotImplementedError do |e|
          error!("NotImplementedError: #{e.message}")
        end
      end
    end
  end
end