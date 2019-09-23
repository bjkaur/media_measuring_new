class StockBatchesController < ApplicationController

    def index
        @stock_batches = StockBatch.all 
        @media_types = MediaType.order(:name) #Console: MediaType.order(:name)
        @media_type_suites = MediaTypeSuite.all 
    end  

    def new
        @media_type = MediaType.find(params[:id])
        @stock_batch = @media_type.stock_batches.build
    end 

    def show
        @stock_batch = StockBatch.includes(:media).find(params[:id])
        @medium = @stock_batch.media.build
    end
 
    def create
        @stock_batch = StockBatch.new(stock_batch_params)
        if @stock_batch.save!
            flash[:success] = "Successfully added Stock."
            redirect_to stock_batches_path
        else
            flash[:danger] = "Stock could not be added. Try again!"
            redirect_to new_stock_batch_path, id: @media_type.id
        end 
    end 

    def edit
        @stock_batch = StockBatch.find(params[:id])     
    end 

    def update 
        @stock_batch = StockBatch.find(params[:id])
        if @stock_batch.update_attributes(stock_batch_params)
            flash[:notice] = "Successfully updated stock."
            redirect_to action: :show, id: @stock_batch.id
        else  
            render action: :edit, id: @stock_batch.id
        end 
    end 

    def delete

    end 

    private
    def stock_batch_params
        params.require(:stock_batch).permit(:id, :media_type_id, :item_count, :lot_number)
    end     
end
