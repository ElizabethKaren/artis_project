require 'rails_helper'
require 'date'

RSpec.describe Device, type: :model do
  context 'validation tests' do 

    it 'ensures presence of phone number' do 
      device = Device.new(phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name).save
      expect(device).to eq(true)
    end 

    # it 'ensures disabled at defaults to nil' do 
    #  device = Device.new(disabled_at: Time.now, phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name).save
    #  expect(device).to eq(false)
    # end 

  end
  

  context 'scope tests' do
    let (:params) { {phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name} }
    before(:each) do
      3.times do
        Device.create(params)
      end 

      2.times do
        device = Device.create(params)
        device.update(disabled_at: DateTime.new(2001,2,3,4,5,6) )
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
