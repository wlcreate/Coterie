class RegistrationsController < ApplicationController

    def new
        # byebug
        @meeting_id = flash[:meeting_id]
        @meeting = Meeting.find(@meeting_id)
        @registration = Registration.new
    end

    def create
        # byebug
        @meeting = Meeting.find(params[:registration][:meeting_id])
        @registration = Registration.create(meeting: @meeting, user: @current_user)
        redirect_to user_path(@current_user)
    end

    

    private

    def reg_params
        params.require(:registration).permit(:meeting_id, :user_id)
    end

end
