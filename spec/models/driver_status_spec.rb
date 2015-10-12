require 'rails_helper'

RSpec.describe DriverStatus, type: :model do
  subject { FactoryGirl.create(:driver_status) }
  
  let(:drives_status_list) { create_list(:driver_status, 3) }
    
  context 'validations' do
    it { expect(validate_presence_of(:available))} 
    it { expect(validate_presence_of(:location))}
  end
  
  context 'associations' do
    it { expect(belong_to(:driver))}
  end
  
  describe ".in_area" do
    before { drives_status_list }
    
    context "when find driver_status" do
      let(:sw) {[0,0]}
      let(:ne) {[100,100]}
      
      it { expect(DriverStatus.in_area(sw,ne)).not_to be_empty }
    end
  
    context "when do not find driver_status" do
      let(:sw) {[0,0]}
      let(:ne) {[-100,-100]}
        
      it { expect(DriverStatus.in_area(sw,ne)).to be_empty }
    end
  end
end