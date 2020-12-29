require 'rails_helper'

RSpec.describe "Heartbeats", type: :request do

    context 'GET #index' do 
        it 'returns a success response' do 
            get :index
            expect(response.status).to eq(200)
        end 
    end 


end
