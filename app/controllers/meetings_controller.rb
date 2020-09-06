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
        @meeting = Meeting.create(meeting_params)
    end


    private

    def get_meeting
        @meeting = Meeting.find(params[:id])
    end

    def meeting_params
        params.require(:meeting).permit(:title, :description, :time, :subcategory_id, :user_id)
    end

end
