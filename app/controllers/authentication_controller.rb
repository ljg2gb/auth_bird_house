class AuthenticationController < ApplicationController
    def login
        @user = User.find_by username: params[:username]
        if !@user
            render json: {message: "Not a valid username"}
        else
            if !@user.authenticate params[:password]
                render json: {message: "Not a valid password"}
            else
                payload = {
                    user_id: @user.id,
                    display_name: @user.display_name
                }
                secret_key = Rails.application.secret_key_base
                token = JWT.encode payload, secret_key
                render json: {token: token}
            end
        end
    end
end
