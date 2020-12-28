require 'rails_helper'

RSpec.describe Heartbeat, type: :model do
  context 'validation tests' do 

    it 'ensures heartbeat is only generated with a device id' do
      heartbeat = Heartbeat.new(device_id: nil ).save
      expect(heartbeat).to eq(false) 
    end 

  end 
end
