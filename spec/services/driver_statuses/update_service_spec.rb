require 'rails_helper'

RSpec.describe Services::DriverStatuses::UpdateService do
  let(:driver_status) { FactoryGirl.create(:driver_status) }
  
  describe "#valid?" do  
    describe "update a driver_status" do
      it "with required params" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id,
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_truthy
      end

      it "without lat" do
        service = Services::DriverStatuses::UpdateService.new(lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id, 
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
      end

      it "without lng" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              driver_id: driver_status.driver_id,
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
      end
      
      it "without driver_id" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
      end
      
      it "without available" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id)
        expect(service.is_valid?).to be_falsey
      end
    end
  end
  
  describe "#call" do
    describe "update the driver status" do
      it "with required params" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id, 
                                                              available: true)
        
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end
      
      it "with invalid driver_id" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              driver_id: BSON::ObjectId.new, 
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end

      it "without lat" do
        service = Services::DriverStatuses::UpdateService.new(lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id,
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end

      it "without lng" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              driver_id: driver_status.driver_id,
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "without driver_id" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              available: driver_status.available)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "without available" do
        service = Services::DriverStatuses::UpdateService.new(lat: driver_status.lat,
                                                              lng: driver_status.lng, 
                                                              driver_id: driver_status.driver_id)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
  end
end