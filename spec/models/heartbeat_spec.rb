require 'rails_helper'

RSpec.describe Heartbeat, type: :model do
  context 'validation tests' do 

    # it 'ensures presence of device id' do
    #   device = Device.new( phone_num: Faker::PhoneNumber.cell_phone, carrier: 'Verizon', disabled_at: Time.current ).save
    #   heartbeat = Heartbeat.new(device_id: device ).save
    #   expect(heartbeat.device).to eq(false) 
    # end 

  end 
end
