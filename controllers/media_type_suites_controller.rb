class MediaTypeSuitesController < ApplicationController
    
    def index 
        @media_type_suites = MediaTypeSuite.all
    end 

    def show 
        @media_type_suite = MediaTypeSuite.find(params[:id])
    end 
    
    def new 
        @media_type_suite = MediaTypeSuite.new
    end 
    
    def create 
        @media_type_suite = MediaTypeSuite.new(media_type_suite_param)
        if @media_type_suite.save!
            redirect_to action: 'index'
        end 
    end 
    
    def edit 
        @media_type_suite = MediaTypeSuite.find(params[:id])
    end 
    
    def update 
        @media_type_suite = MediaTypeSuite.find(params[:id])
        if @media_type_suite.update_attributes(media_type_suite_param)
            redirect_to action: 'show', :id => @media_type_suite
        end 
    end 
    
    def delete 
        MediaTypeSuite.find(params[:id]).destroy
        redirect_to action: 'index'
    end 

    def media_type_suite_param
        params.require(:media_type_suites).permit(:name)
    end 

end
