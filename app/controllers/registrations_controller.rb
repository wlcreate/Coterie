class RegistrationsController < ApplicationController
    before_action :get_registration, only: [:show, :edit, :update, :destroy]

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
        redirect_to user_meetings_path(@current_user)
    end

    def edit
    end

    def destroy
        @registration.destroy
        redirect_to user_meetings_path(@current_user)
    end


    private

    def get_registration
        @registration = Registration.find(params[:id])
    end

end
