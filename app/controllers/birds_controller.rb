class BirdsController < ApplicationController
    def index
        @birds = Bird.all
        render json: { birds: @birds }
    end

    def create
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret_key = Rails.application.secret_key_base
        payload = JWT.decode(token, secret_key)[0]
        user_id = payload["user_id"]
        display_name = payload["display_name"]
        @user = User.find(user_id)


        if !token
            render status: :unauthorized
        else
            @bird = Bird.create({ 
                color: params[:color],
                species: params[:species]
            }) 
            render json: { bird: @bird }
        end
    end
end
