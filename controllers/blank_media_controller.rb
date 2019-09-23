class BlankMediaController < ApplicationController
   
    def index 
        @blank_media = BlankMedium.all
        @blank_measurements = BlankMeasurement.all
        @media_types = MediaType.all
    end 

    def new
        @blank_medium = BlankMedium.new 
    end
    
    def create
        #@blank_medium = BlankMedium.new blank_medium_params
        @blank_medium = BlankMedium.blank_medium_params
        if @blank_medium.save
           redirect_to new_blank_media_path
        end 
    end 

    def show
        @blank_medium = BlankMedium.find(params[:id])
    end 

    def edit
        @blank_medium = BlankMedium.find(params[:id])
    end
    
    def update
        @blank_medium = BlankMedium.find(params[:id])
        if @blank_medium.update_attributes{blank_medium_param}
            redirect_to action: "show", :id => @blank_medium
        end 
    end 

    def delete
        BlankMedium.find(params[:id]).destroy
        redirect_to to action: 'index'
    end 

    def blank_medium_params
        params[:blank_medium].permit!
    end 

end

