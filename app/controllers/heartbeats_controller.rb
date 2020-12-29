class HeartbeatsController < ApplicationController
    def index 
        heartbeats = Heartbeat.all 
        render json: heartbeats.to_json(:include => {
            :device => {:only => [:phone_num, :carrier, :disabled_at]}
        }, except: [:created_at, :updated_at, :device_id])
    end 
end
