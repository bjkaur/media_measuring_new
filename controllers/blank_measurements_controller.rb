class BlankMeasurementsController < ApplicationController
    
    def index
        @media = Medium.all
        @media_types = MediaType.all 

        @blank_measurements = BlankMeasurement.all
        @blank_media = BlankMedium.all
    end 
    
    ####
    # Blank forms are different depending on Pre-conditioned or Standard Filter
    # Pre-Conditioned Filter Blank has 9 weights
    # Standard Filter has 3 weights 
    # Both saved in the Blank Measurements Table
    def new
       @blank_measurement = BlankMeasurement.new 
       #@blank_measurement = @blank_media.media_type.build 

       #if MediaType.where(@blank_measurement.blank_medium.media_type.measurement_suite.name => "Preconditioned Filters")
        #render partial: "preconditioned_blank_weights"
       #else  
        #render partial:  "standard_blank_weights"
       #end 
    end 

    def edit 
        @blank_measurement = BlankMeasurement.find params[:id]
        @blank_measurement = @blank_measurement.blank_medium.media_type.build 
    end 

    def show
        @blank_measurement = BlankMeasurement.find(params[:id])
        @blank_medium = @blank_measurement.blank_medium
    end 

    def create
        @blank_measurement = BlankMeasurement.new blank_measurement_param
        #store to database!
        @blank_measurement.save! 

        #@blank_medium = BlankMedium.find(params[:blank_medium_id])
        #Create a blank measurement
        #@blank_measurement = @blank_medium.blank_measurements.build(blank_measurement_params)
        #@blank_measurement.save
    end 

    def edit 
        @blank_measurement = BlankMeasurement.new
        @blank_media = BlankMedium.find
    end
    
    def update
        @blank_measurement = BlankMeasurement.find(blank_measurement_param)
        if @blank_measurement.update_attributes(blank_measurement_param)
            redirect_to action: :show, id: @blank_measurement
        else
            BlankMeasurement.all
        end 
    end 

    def delete
        BlankMeasurement.find(params[:id]).destroy
        redirect_to action: :edit
    end 

    private 
    def blank_measurement_param
        params[:blank_measurement]
    end 

end
