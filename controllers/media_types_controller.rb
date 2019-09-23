class MediaTypesController < ApplicationController

    # Shows a list of all the media types in the database
    # Search the media types table and store each row it finds in the @media_types instance object.
    def index
        @measurement_suites = MeasurementSuite.all 
        @media_types = MediaType.all
        @media_type = MediaType.new 
        #@stock_batches = StockBatch.all
    end 

    def new
        # To get suite Names from Measurement Suites in 'new form' 
        @measurement_suites = MeasurementSuite.all 
        @media_type = MediaType.new
    end 

    # Create a record in database
    def create
        @media_type = MediaType.new(media_type_param)
        if @media_type.save!
            flash[:success] = "New Media Type Created."
            redirect_to media_types_path
        end
    end 
    
    def create_media
    end 

    # Find specifc media type linked to id 
    def show
        @media_type = MediaType.find(params[:id])
    end  
        
    def edit
        @media_type = MediaType.find(params[:id])
    end 
  
    def update
        @media_type = MediaType.find(params[:id])

        if @media_type.update_attributes(media_type_param)
            flash[:notice] = "Successfully updated Media Type"
            redirect_to @media_type.id
        end 
    end 
  
    def delete
        @media_type = MediaType.find(params[:id]).destroy
        flash[:notice] = "Media Type deleted."
        redirect_to media_types_path
    end 

    def media_type_name
        return name 
    end 

    def search
        @media_types = MediaType.all 
        @media_type = MediaType.new #Filter dropdown

        @measurement_suites = MeasurementSuite.all #Filter dropdown
    end 

    # Collect all the fields from object media_type
    private

    def media_type_param
        params.require(:media_type).permit(:id, :name, :measurement_suite_id, measurement_name_ids: [], stock_batch_ids: [])
    end
end
