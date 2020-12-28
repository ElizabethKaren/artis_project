require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'validation tests' do 

    it 'ensures presence of phone number' do 
      device = Device.new(phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name).save
      expect(device).to eq(true)
    end 

    it 'ensures disabled at defaults to nil' do 
    device = Device.new(disabled_at: Time.now, phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name).save
    expect(device).to eq(false)
    end 

  end 
end
