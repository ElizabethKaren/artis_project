class HeartbeatsController < ApplicationController
    def index 
        heartbeats = Heartbeat.all 
        render json: heartbeats.to_json
    end

    def new
        Heartbeat.new
    end 

    def create
        heatbeat = Heartbeat.create(heartbeat_params)
        if heatbeat.id 
            render json: heatbeat.to_json
        else
            render json: { 'status': 500, 'error': 'Invalid phone number' }, status: :internal_server_error
        end
    end

    private 

    def heartbeat_params
        params.require(:heartbeat).permit(:device_id )
    end 
end
