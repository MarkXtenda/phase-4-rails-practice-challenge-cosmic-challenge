class PlanetsController < ApplicationController
    def index
        planets = Planet.all 
        if planets 
            render json: planets
        end
    end

    def show
    end

    def create
    end
end
