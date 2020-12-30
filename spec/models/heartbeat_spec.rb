require 'rails_helper'
require 'time'

RSpec.describe Heartbeat, type: :model do

  context 'validation tests' do 

    it 'ensures presence of device id' do
      device = Device.inactive_devices.first 
      heartbeat = Heartbeat.new(device_id: device ).save
      expect(heartbeat.device).to eq(false) 
    end 

  end 
end
