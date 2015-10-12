require 'rails_helper'

RSpec.describe Services::Drivers::CreateService do
  let(:driver) { FactoryGirl.build(:driver) }
  let(:created_driver) { FactoryGirl.create(:driver) }
  
  describe "#valid?" do  
    describe "create a new driver" do
      it "with required params" do
        service = Services::Drivers::CreateService.new(name: driver.name,
                                                       car_plate: driver.car_plate)
        expect(service.is_valid?).to be_truthy
      end

      it "without name" do
        service = Services::Drivers::CreateService.new(car_plate: driver.car_plate)
        expect(service.is_valid?).to be_falsey
      end
      
      it "without car_plate" do
        service = Services::Drivers::CreateService.new(name: driver.name)
        expect(service.is_valid?).to be_falsey
      end
      
      it "with a invalid car_plate" do
        service = Services::Drivers::CreateService.new(car_plate: "APM2015")
        expect(service.is_valid?).to be_falsey
      end
      
      it "with a already used car_plate" do
        service = Services::Drivers::CreateService.new(car_plate: created_driver.car_plate)
        expect(service.is_valid?).to be_falsey
      end
    end
  end
  
  describe "#call" do
    describe "create a new driver" do
      it "with required params" do
        service = Services::Drivers::CreateService.new(name: driver.name,
                                                       car_plate: driver.car_plate)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end

      it "without name" do
        service = Services::Drivers::CreateService.new(car_plate: driver.car_plate)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "without car_plate" do
        service = Services::Drivers::CreateService.new(name: driver.name)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "with a invalid car_plate" do
        service = Services::Drivers::CreateService.new(car_plate: "APM2015")
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "with a already used car_plate" do
        service = Services::Drivers::CreateService.new(car_plate: created_driver.car_plate)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
  end
end