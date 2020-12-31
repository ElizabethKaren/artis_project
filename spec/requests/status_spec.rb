require 'rails_helper'

RSpec.describe 'Status request' do 
    describe 'GET /status' do 
        it 'returns a status message' do 
            get('/status')
            json = JSON.parse(response.body)
            expect(response.status).to eq(200)
        end 
    end 
  end 