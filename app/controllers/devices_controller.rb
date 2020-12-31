class DevicesController < ApplicationController
    def index
        devices = Device.all.active_devices
        render json: devices.to_json(:include => {
            :reports => {:only => [:sender, :message]}
        }, except: [:created_at, :updated_at, :device_id])
    end 

    def new
        Device.new
    end 

    def create 
        device = Device.create(device_params)
        if device.id
            render json: device.to_json
        else 
            render json: { 'status' => 500, 'error' => 'Invalid phone number' }, status: :internal_server_error
        end 
    end 

    def edit 
        Device.find(params[:id])
    end 

    def updated
        device = Device.find(params[:id])
        if device.id
            device.update(device_params)
            render json: device.to_json
        else 
            render json: { 'status' => 500, 'error' => 'Invalid phone number' }, status: :internal_server_error
        end 
        
    end 

    def show
        device = Device.find(params[:id])
        render json: device.to_json(:include => {
            :reports => {:only => [:sender, :message]}
        }, except: [:created_at, :updated_at, :device_id])
    end

    def destroy
        device = Device.find(params[:id])
        device.update(disabled_at: Time.current )
    end 

    private 

    def device_params 
        params.require(:device).permit(:phone_num, :carrier)
    end 
end
