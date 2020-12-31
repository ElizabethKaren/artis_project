require 'rails_helper'

RSpec.describe 'Status request' do 

    describe 'GET /status' do 
        it 'returns a status of 200' do 
            get('/status')
            expect(response.status).to eq(200)
        end

        it 'returns a status message' do 
            get('/status')
            json = JSON.parse(response.body)
            expect(json['status']).to eq('ok')
        end 
    end
    
  end 