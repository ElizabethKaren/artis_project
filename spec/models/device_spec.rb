require 'rails_helper'
require 'date'

RSpec.describe Device, type: :model do
  context 'validation tests' do 

    it 'ensures presence of phone number' do 
      device = Device.new(carrier: Faker::Company.name).save
      expect(device).to eq(false)
    end

    it 'ensures presence of carrier' do 
      device = Device.new(phone_num: Faker::PhoneNumber.cell_phone ).save
      expect(device).to eq(false)
    end 

  end
  

  context 'scope tests' do
    let (:params) { {phone_num: Faker::PhoneNumber.cell_phone, carrier: Faker::Company.name} }
    before(:each) do
      3.times do
        Device.new(params).save
      end 

      2.times do
        device = Device.new(params.merge(disabled_at: DateTime.new(2019, 8, 10, 4, 10, 9))).save
      end
    end 

    it 'should return active devices' do 
      expect(Device.active_devices.size).to eq(3)
    end 

    it 'should return inactive devices' do 
      expect(Device.inactive_devices.size).to eq(2)
    end 

  end 
end
