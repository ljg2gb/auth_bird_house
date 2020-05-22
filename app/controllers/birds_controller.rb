class BirdsController < ApplicationController
    before_action :authenticate, only: [:create, :destroy]

    def index
        @birds = Bird.all
        render json: { birds: @birds }
    end

    def create
        @bird = Bird.create({ 
            color: params[:color],
            species: params[:species]
        }) 
        render json: { bird: @bird }
    end

    def destroy
        @bird = Bird.find(params[:id])
        @bird.destroy
        render json: {message: "Bird successfully deleted"}
    end

end
 