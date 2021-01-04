class ReportsController < ApplicationController
    def index
        reports = Report.all 
        render json: reports.to_json
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
        render json: report.to_json
    end

    private 

    def report_params 
        params.require(:report).permit(:message, :sender, :device_id )
    end 
end
