require 'rails_helper'

RSpec.describe "Reports", type: :request do

    context 'can create a new report' do 
        it 'ensures creation of a new report' do
            device = Device.create(phone_num: Faker::PhoneNumber.cell_phone, carrier: 'Verizon')
            post('/reports', params:{ report: { device_id: device.id, message: 'Cats are cute!', sender: 'Robert' }})
            expect(response.status).to eq(200)
        end 
    end 

    context 'enables report if phone number is invalid' do 
        it 'ensures error message on invalid report' do
            post('/reports', params:{ report: { device_id: nil, message: 'Cats are cute!', sender: 'Robert' }})
            json = JSON.parse(response.body)
            expect(json['error']).to eq('Invalid phone number')
        end 

        it 'ensures 500 status on invalid report' do
            post('/reports', params:{ report: { device_id: nil, message: 'Cats are cute!', sender: 'Robert' }})
            expect(response.status).to eq(500)
        end 
    end 

end 