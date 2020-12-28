require 'rails_helper'

RSpec.describe Device, type: :model do

  context 'validation tests' do 
    it 'ensures disabled_at defaults to nil' do 
      device = Device.new(disabled_at: Time.now, phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name).save
    expect(device).to eq(true)
    end 

  end 
end
