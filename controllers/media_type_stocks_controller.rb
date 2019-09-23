class MediaTypeStocksController < ApplicationController
   
    def index
        @media_type_stocks = MediaTypeStocks.all
    end 

    def new
        @media_type = MediaType.find(params[:id])
        
        @media_type_stock = @stock_batch.media_type.media_stock.build(params[:media_stock]) 
        @media_type_stock.media_type_id = @media_type.id
        @media_type_stock.stock_batch_id = @stock_batch.id
    end 
 
    def show
    end 

    def create
    end 

    def edit
    end 

    def update
    end 

    def delete
    end 
end
 