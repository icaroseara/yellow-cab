module Services::Drivers
  class CreateService < Services::Base
    attr_accessor :name, :car_plate

    validates_presence_of :name, :car_plate

    def call
      Driver.create(name: name, car_plate: car_plate) if valid?
    end

    def is_valid?
      valid?
    end
  end
end
