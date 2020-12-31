require 'rails_helper'

RSpec.describe "Devices", type: :request do
    context 'GET #index' do 
        it 'returns a success response' do
            get('/devices')
            expect(response.status).to eq(200)
        end 
    end

    context 'GET #show' do
        it 'returns a success response' do 
            device = Device.new(phone_num: '666 666-6666', carrier: 'Verizon')
            get("/devices/#{device.id}")
            expect(response.status).to eq(200)
        end 
    end

    context 'GET #create' do
        it 'returns error if phone number not provided' do 
            device = Device.new(phone_num: nil, carrier: 'Verizon')
            get("/devices/new")
            json = JSON.parse(response.body)
            expect(json['error']).to eq('Invalid phone number')
        end 

        it 'returns 500 status' do 
            device = Device.new(phone_num: nil, carrier: 'Verizon')
            get("/devices/new")
            expect(response.status).to eq(500)
        end 
    end 

end
