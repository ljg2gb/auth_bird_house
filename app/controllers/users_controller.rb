class UsersController < ApplicationController
    def create
        @user = User.create({
            username: params[:username],
            password: params[:password],
            display_name: params[:display_name]
        })
        render json: { user: @user }, status: :created
    end
end
