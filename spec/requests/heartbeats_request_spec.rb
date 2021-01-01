require 'rails_helper'

RSpec.describe "Heartbeats", type: :request do

    context '/alive/api creates a new heatbeat' do 
        it 'ensures creation of a new heatbeat' do
            device = Device.create(phone_num: Faker::PhoneNumber.cell_phone, carrier: 'Verizon')
            post('/alive/api', params:{ heartbeat: { device_id: device.id }})
            expect(response.status).to eq(200)
        end 
    end 

    context 'enables heartbeat if phone number is invalid' do 
        it 'ensures error message on invalid heartbeat' do
            post('/alive/api', params:{ heartbeat: { device_id: nil }})
            json = JSON.parse(response.body)
            expect(json['error']).to eq('Invalid phone number')
        end 

        it 'ensures 500 status on invalid heartbeat' do
            post('/alive/api', params:{ heartbeat: { device_id: nil }})
            expect(response.status).to eq(500)
        end 
    end 

end 