class ApplicationController < ActionController::API
    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret_key = Rails.application.secret_key_base

        begin
            payload = JWT.decode(token, secret_key)[0]
            user_id = payload["user_id"]
            display_name = payload["display_name"]
            @user = User.find(user_id)


            if !@user
                render status: :unauthorized
            end
        rescue
            render status: :unauthorized
        end
    end
end
 