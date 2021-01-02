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
            expect {
                post('/devices', params: { device: { phone_num: '609 882-7543', carrier: 'Verizon'} } )
            }.to change { Device.count }.from(0) .to(1)

            expect(response.status).to eq(200)
        end 

        it 'renders error if phone number not provided' do 
            post('/devices', params: { device: { carrier: 'Verizon'} })
            json = JSON.parse(response.body)
            expect(json['error']).to eq('Invalid phone number')
        end 

        it 'renders 500 status' do 
            post('/devices', params: { device: { carrier: 'Verizon'} })
            expect(response.status).to eq(500)
        end 
    end

    describe 'if app is deleted device updated disabled at to current time' do 

        it 'Updates disabled_at to current time' do 
            device = Device.create(phone_num: Faker::PhoneNumber.cell_phone, carrier: 'Verizon')
            patch("/devices/#{device.id}")
            json = JSON.parse(response.body)
            expect(json['message']).to eq("#{device.phone_num} disabled at #{Time.current}")
        end 

    end 


end
