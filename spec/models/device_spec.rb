require 'rails_helper'
require 'time'

RSpec.describe Device, type: :model do

  context 'validation tests' do 

    it 'ensures presence of phone number' do 
      device = Device.new(carrier: 'T-Mobile').save
      expect(device).to eq(false)
    end

    it 'ensures presence of carrier' do 
      device = Device.new(phone_num: Faker::PhoneNumber.cell_phone).save
      expect(device).to eq(false)
    end 

  end
  
  context 'scope tests' do
    let (:params) {{ phone_num: Faker::PhoneNumber.cell_phone, carrier: 'Verizon' }}
    before(:each) do

      Device.new(params).save
      Device.new(params).save
      Device.new(params).save

      Device.new(params.merge(disabled_at: Time.current)).save
      Device.new(params.merge(disabled_at: Time.current)).save
      Device.new(params.merge(disabled_at: Time.current)).save

    end 

    it 'should return active devices' do 
      expect(Device.active_devices.size).to eq(3)
    end 

    it 'should return inactive devices' do
      expect(Device.inactive_devices.size).to eq(3)
    end 

  end

end
