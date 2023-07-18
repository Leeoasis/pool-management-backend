module Api
    module V1
      class PoolInstallationsController < ApplicationController
        # GET /api/v1/pool_installations
        def index
          # Retrieve all pool installations
          pool_installations = PoolInstallation.all
          render json: pool_installations
        end
  
        # GET /api/v1/pool_installations/:id
        def show
          # Retrieve a specific pool installation
          pool_installation = PoolInstallation.find(params[:id])
          render json: pool_installation
        end
  
        # POST /api/v1/pool_installations
        def create
          # Create a new pool installation
          pool_installation = PoolInstallation.new(pool_installation_params)
          if pool_installation.save
            render json: pool_installation, status: :created
          else
            render json: pool_installation.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH /api/v1/pool_installations/:id
        def update
          # Update a specific pool installation
          pool_installation = PoolInstallation.find(params[:id])
          if pool_installation.update(pool_installation_params)
            render json: pool_installation
          else
            render json: pool_installation.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/pool_installations/:id
        def destroy
          # Delete a specific pool installation
          pool_installation = PoolInstallation.find(params[:id])
          pool_installation.destroy
          head :no_content
        end
  
        private
  
        def pool_installation_params
          params.require(:pool_installation).permit(:name, :description)
        end
      end
    end
  end
  