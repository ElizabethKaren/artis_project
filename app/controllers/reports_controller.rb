class ReportsController < ApplicationController
    def index
        reports = Report.all 
        render json: reports.to_json
        # (:include => {
        #     :device => {:only => [:phone_num, :carrier, :disabled_at]}
        # }, except: [:created_at, :updated_at, :device_id])
    end 

    def new 
        Report.new
    end 

    def create
        report = Report.create(report_params)
        if report.id 
            render json: report.to_json
        else
            render json: { 'status' => 500, 'error' => 'Invalid phone number' }, status: :internal_server_error
        end

    end 

    def show
        report = Report.find(params[:id])
        render json: report.to_json(:include => {
            :device => {:only => [:phone_num, :carrier, :disabled_at]}
        }, except: [:created_at, :updated_at, :device_id])
    end

    private 

    def report_params 
        params.require(:report).permit(:message, :sender, :device_id )
    end 
end
