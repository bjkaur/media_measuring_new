class MediaController < ApplicationController
    def index
    end  

    #####
    # Create Medium/Media for Media Type in last Stock added for that Media Type
    #####
    def new
        @measurement_suites = MeasurementSuite.all 
        @media_type = MediaType.find(params[:id])#.stock_batches.last #create medium for media type
        @stock_batch = StockBatch.where({media_type_id: @media_type.id}).last
        @medium = @stock_batch.media_type.media.build(params[:medium])
        @medium.media_type_id = @media_type.id
        @medium.stock_batch_id = @stock_batch.id

        #@media_type = MediaType.find(params[:id])#.stock_batches.last #create medium for media type
        #@stock_batch = StockBatch.where(params[:media_type_id] => @media_type.id).last
    end 

    #####
    # Create Media and saves in database 
    # for Media Type and Stock
    #####
    def create
        #creates mulitple media ids
        medium_ids = []
        params[:medium][:medium_qty].to_i.times do |x| 
            logger.info x.inspect
            
            medium = Medium.new(medium_params)
            if medium.save!
                medium_ids << medium.id
            end
        end
        redirect_to action: :show, medium_ids: medium_ids
        #redirect_to controller: :measurements, action: :new, medium_ids: medium_ids
    end 

    # Show Media and Barrcodes to print
    def show
        @media = Medium.find(params[:medium_ids])
    end 
   
    def edit
        @medium = Medium.find(params[:id])
        @media_types = MediaType.all       
    end 

    def update
        @medium = Medium.find(params[:id])
        @medium.update_attributes(medium_params)
        redirect_to action: :show, id: @medium.id
    end 

    ####
    # URL http://127.0.0.1:3000/measurements/new?id=medium_id 
    # Deletes the Medium when 'Cancel' measurements
    ####
    def delete
        Medium.find(params[:id]).destroy
        redirect_to measurements_path
    end 

    def print
        byebug
        1==1
        print_helper = create_file
    end

    def medium_params
        params.require(:medium).permit(:id, :media_type_id, :stock_batch_id, :medium_qty)
    end

end

