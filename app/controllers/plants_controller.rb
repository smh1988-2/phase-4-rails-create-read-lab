class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        plant = Plant.all
        render json: plant, status: :ok
    end

    def show
        plant = Plant.all.find_by_id(params[:id])

        if plant
        render json: plant, status: :ok
        else
            render json: {"error:"=>"you done goofed"}, status: :not_found
        end
    end

    def create
        new_plant =Plant.create(plant_params)
        render json: new_plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
