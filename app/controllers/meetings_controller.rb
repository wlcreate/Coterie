class MeetingsController < ApplicationController

    before_action :get_meeting, only: [:show, :edit, :update, :destroy]

    def index
        # meeting.user = host
        # meeting.users = attendees

        # 1. need to go through a specific meeting to find the host of the meeting
        #     we map over all the meetings
        #     if meeting.user == @current_user
        #         then list the meeting title & time
        # 2. need to go through a specific meeting to find the attendees of the meeting
        @meetings = Meeting.all
        @registrations = @current_user.registrations
    end
    
    def new
        @categories = Category.all
    end

    def meeting_form
        # byebug
        @meeting = Meeting.new
        @category = Category.find_by(name: params[:category_id])
        @subcategories = @category.subcategories
    end

    def create
        # byebug
        subcategory_id = params[:meeting][:subcategory_id].to_i
        @subcategory = Subcategory.find(subcategory_id)
        @category = @subcategory.category
        @description = params[:meeting][:description]
        @title = params[:meeting][:title]

        year = params[:meeting]["time(1i)"].to_i
        month = params[:meeting]["time(2i)"].to_i
        day = params[:meeting]["time(3i)"].to_i
        hour = params[:meeting]["time(4i)"].to_i
        minute = params[:meeting]["time(5i)"].to_i
        @time = DateTime.new(year, month, day, hour, minute)
        @meeting = Meeting.create(title: @title, description: @description, time: @time, subcategory: @subcategory, category: @category, user: @current_user)
        
        redirect_to meeting_path(@meeting)
    end

    def show
        # byebug
        flash[:meeting_id] = params[:id]
    end

    def edit
        
    end

    def update
        @meeting.update(meeting_params)
        redirect_to user_meetings_path(@current_user)
    end
    
    def destroy
        @meeting.destroy
        redirect_to user_meetings_path(@current_user)
    end

    private

    def get_meeting
        @meeting = Meeting.find(params[:id])
    end

    def meeting_params
        params.require(:meeting).permit(:title, :description, :time, :category, :subcategory)
    end

end
