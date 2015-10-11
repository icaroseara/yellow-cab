require 'rails_helper'

RSpec.describe DriverStatus, type: :model do
  subject { FactoryGirl.create(:driver_status) }
  
  context 'validations' do
    it { expect(validate_presence_of(:location))}
  end
  
  context 'associations' do
    it { expect(belong_to(:driver))}
  end
end