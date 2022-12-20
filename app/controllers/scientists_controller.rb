class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
        scientists = Scientist.all 
        if scientists 
            render json: scientists
        end
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistShowSerializer
    end

    def create
        scientist = Scientist.create!(permited_params)
        if scientist 
            render json: scientist, status: :created
        end
    end

    def update 
        scientist = Scientist.find(params[:id])
        if scientist 
            scientist.update!(permited_params)
            render json: scientist, status: :accepted
        end
    end

    def destroy
        scientist = Scientist.find(params[:id])
        if scientist 
            scientist.destroy
            head :no_content
        end
    end

    private

    def permited_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def record_invalid
        render json: { "errors": ["validation errors"] }, status: :unprocessable_entity
    end

    def record_not_found
        render json: {"error": "Scientist not found"}, status: :not_found
    end
end

