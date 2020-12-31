require 'rails_helper'
require 'time'

RSpec.describe Heartbeat, type: :model do

  context 'validation tests' do 

    it 'ensures presence of device id' do 
      heartbeat = Heartbeat.new(device_id: nil ).save
      expect(heartbeat.device).to eq(false) 
    end 

    it 'ensures device is active' do 
      heartbeat = Heartbeat.new(device_id: Device.inactive_devices.first.id ).save
      expect(heartbeat.device).to eq(false) 
    end 

  end 
end
