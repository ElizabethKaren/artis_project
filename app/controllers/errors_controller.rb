class ErrorsController < ApplicationController
  def invalid_phone_number
    reder status: 500 
  end
end
