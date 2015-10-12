require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject { FactoryGirl.create(:driver) }
  
  context 'validations' do
    it { expect(validate_presence_of(:name))}
    it { expect(validate_presence_of(:car_plate))} 
    it { expect(validate_uniqueness_of(:car_plate))}
  end
  
  context 'associations' do
    it { expect(have_many(:driver_statuses))}
  end
  
  context 'with a invalid car_plate' do
    let(:driver) { FactoryGirl.build(:driver, car_plate: "ICS2015") }
    
    it { expect(driver).to_not be_valid}
  end
end