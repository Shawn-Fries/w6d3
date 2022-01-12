class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create 
        user = User.new(params.require(:user).permit(:name,:email))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @users = User.find(params[:id])
        render json: @users
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end


    private
    def user_params
        params.require(:user).permit(:body)
    end

end