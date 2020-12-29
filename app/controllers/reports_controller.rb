class ReportsController < ApplicationController
    def index
        reports = Report.all 
        render json: reports.to_json(:include => {
            :device => {:only => [:phone_num, :carrier, :disabled_at]}
        }, except: [:created_at, :updated_at, :device_id])
    end 

    def show
        report = Report.find(params[:id])
        render json: report.to_json(:include => {
            :device => {:only => [:phone_num, :carrier, :disabled_at]}
        }, except: [:created_at, :updated_at, :device_id])
    end 
end
