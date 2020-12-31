require 'rails_helper'
require 'time'

RSpec.describe Heartbeat, type: :model do

  context 'validation tests' do 

    it 'ensures device is active' do
      # device = Device.new(phone_num: Faker::PhoneNumber.cell_phone, carrier: 'T-Mobile', disabled_at: Time.current ).save!
      heartbeat = Heartbeat.new( device: Device.inactive_devices.sample ).save
      expect(heartbeat).to eq(false) 
    end 

  end 
end
