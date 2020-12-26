class DevicesController < ApplicationController
    def index
        @devices = Device.all
        render json: @devices.to_json(:include => {
            :reports => {:only => [:sender, :message]}
        }, except: [:created_at, :updated_at, :device_id])
    end 

    def show
        @device = Device.find(params[:id])
        render json: @device.to_json 
    end 
end
