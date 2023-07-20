class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def show
        render json: @user, status: :created
    end
    
    
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end



    private

    def user_params
        params.permit(:id, :username, :password, :password_confirmation, :bio, :image_url)
    end
   
end
