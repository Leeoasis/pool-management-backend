module Api
    module V1
      class PoolCleaningsController < ApplicationController
        # GET /api/v1/pool_cleanings
        def index
          # Retrieve all pool cleanings
          pool_cleanings = PoolCleaning.all
          render json: pool_cleanings
        end
  
        # GET /api/v1/pool_cleanings/:id
        def show
          # Retrieve a specific pool cleaning
          pool_cleaning = PoolCleaning.find(params[:id])
          render json: pool_cleaning
        end
  
        # POST /api/v1/pool_cleanings
        def create
          # Create a new pool cleaning
          pool_cleaning = PoolCleaning.new(pool_cleaning_params)
          if pool_cleaning.save
            render json: pool_cleaning, status: :created
          else
            render json: pool_cleaning.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH /api/v1/pool_cleanings/:id
        def update
          # Update a specific pool cleaning
          pool_cleaning = PoolCleaning.find(params[:id])
          if pool_cleaning.update(pool_cleaning_params)
            render json: pool_cleaning
          else
            render json: pool_cleaning.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/pool_cleanings/:id
        def destroy
          # Delete a specific pool cleaning
          pool_cleaning = PoolCleaning.find(params[:id])
          pool_cleaning.destroy
          head :no_content
        end
  
        private
  
        def pool_cleaning_params
          params.require(:pool_cleaning).permit(:date, :description, :pool_installation_id)
        end
      end
    end
  end
  