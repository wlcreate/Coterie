class MeetingsController < ApplicationController

    before_action :get_meeting, only: [:show, :edit, :update, :destroy]

    def index
        @meetings = Meeting.all
    end
    
    def new
        @meeting = Meeting.new
        @categories = Category.all
        @subcategories = Subcategory.all
    end

    def create
        @categories = Category.all
        @subcategories = Subcategory.all
        @meeting = Meeting.create(meeting_params)
        @meeting[:user_id] = @current_user.id
        redirect_to meeting_path(@meeting)
    end

    def show
    end


    private

    def get_meeting
        @meeting = Meeting.find(params[:id])
    end

    def meeting_params
        params.require(:meeting).permit(:title, :description, :time, :subcategory)
    end

end
