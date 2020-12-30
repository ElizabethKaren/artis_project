require 'rails_helper'

RSpec.describe "Errors", type: :request do

  describe "GET /invalid_phone_number" do
    it "returns http success" do
      get "/errors/invalid_phone_number"
      expect(response).to have_http_status(:success)
    end
  end

end
