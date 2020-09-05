class UsersController < ApplicationController

    before_action :get_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors]= @user.errors.full_messages
            redirect_to new_user_path
        end 
    end

    def show
    end

    def edit 
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to new_user_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :bio)
    end

    def get_user
        @user = User.find(params[:id])
    end

end
