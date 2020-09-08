class UsersController < ApplicationController

    before_action :get_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized_to_see_page, only: [:login, :handle_login, :new, :create]

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors]= @user.errors.full_messages
            redirect_to new_user_path
        end 
    end


    def login
        @error = flash[:error]
    end


    def handle_login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Incorrect username or password. Please try again."
            redirect_to login_path
        end
    end


    def show
        @current_user = User.find_by(id: session[:user_id])
    end


    def logout
        session[:user_id] = nil
        redirect_to login_path
    end


    def edit 
    end

    def update
        if @current_user.authenticate(params[:user][:password]) && @current_user.update(user_params)
            redirect_to user_path(@current_user)
        else
            redirect_to edit_user_path(@current_user)
        end
    end

    def destroy
        @current_user.destroy
        redirect_to new_user_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :bio)
    end

    def get_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
