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

    context 'POST #create' do
        it 'creates a new device' do 
            post('/devices', params: { device: { phone_num: '609 882-7543', carrier: 'Verizon'} } )
            expect(response.status).to eq(200)
        end 

        it 'renders error if phone number not provided' do 
            post('/devices', params: { device: { phone_num: nil, carrier: 'Verizon'} })
            json = JSON.parse(response.body)
            expect(json['error']).to eq('Invalid phone number')
        end 

        it 'renders 500 status' do 
            post('/devices', params: { device: { phone_num: nil, carrier: 'Verizon'} })
            expect(response.status).to eq(500)
        end 
    end 


end
