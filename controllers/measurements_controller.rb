class MeasurementsController < ApplicationController
    
    def index
        #Type
        @media_types = MediaType.order(:name)
        @media = Medium.all

        @media_type = MediaType.new #Filter dropdown
        @measurement_suites = MeasurementSuite.all #Filter dropdown
    end  

    # To make a new measurement
    # Create a new medium for media type for that measurement
    # Creates measurements for that Medium 
    def new
        @measurements = Measurement.all
        @pre_weight = MeasurementName.find(10000)
        @post_weight = MeasurementName.find(10001)
        @comment = MeasurementName.find(10020)
        @darkness = MeasurementName.find(10002)

        @medium = Medium.find(params[:id])
        @measurement = @medium.measurements.build
    end 
    
    def create
        @measurement = Measurement.new(measurement_params)
        if @measurement.save!
            redirect_to controller: :measurements, action: :new, id: @medium.id
            flash[:success] = "Measurements saved."
        else
            flash[:secondary] = "Measurements not saved."
        end 
    end 
    
    def destroy
        @medium.destroy
    end 

    def edit
        @values = Medium.find(:all,
            order: :id).
            collect do |c|
                [c.id]
            end
    end 

    private
    
    def measurement_params
        params.require(:measurement).permit(:id, :medium_id, :value, :measurement_name_id)
    end 
end
