require 'rails_helper'

RSpec.describe Heartbeat, type: :model do

  context 'validation tests' do 

    it 'ensures device is active' do
      heartbeat = Heartbeat.new( device_id: Device.inactive_devices.sample.id ).save
      expect(heartbeat).to eq(false) 
    end 

  end 
end
