class MeasurementNamesController < ApplicationController
    def index
        @standard_measurements = StandardMeasurement.all
        @measurement_names = MeasurementName.all
    end 

    def show
        @measurement_name = MeasurementName.find(params[:id])
    end 
    
    def measurement_name_params
        params[:measurement_name].permit!
    end 

end
