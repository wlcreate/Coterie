class MeetingsController < ApplicationController

    before_action :get_meeting, only: [:show, :edit, :update, :destroy]

    def index
        @meetings = Meeting.all
    end
    
    def new
        @categories = Category.all
    end

    # def get_category
    #     # category_id = params[:meeting][:id].to_i
    #     # @category = Category.find(category_id)
    #     byebug
    #     redirect_to meeting_form_path(@meeting)
    # end

    def meeting_form
        byebug
        @meeting = Meeting.new
        @category = Category.find_by(name: params[:category_id])
        @subcategories = @category.subcategories
    end

    def create
        byebug

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

    # def create_subcat
    #     @categories = Category.all
    #     @subcategories = Subcategory.all
    #     @meeting = Meeting.create(meeting_params)
    #     @meeting[:user_id] = @current_user.id
    #     ##### why isn't meeting being saved in the database???
    #     ##### once the issue is fixed //next step:
    #     ##### register the host as an attendee to the meeting
    #     ##### Registration.new(:meeting_id = @meeting.id, user_id = @current_user.id)
    #     redirect_to meeting_path(@meeting)
    # end

    def show
    end




    private

    def get_meeting
        @meeting = Meeting.find(params[:id])
    end

    def meeting_params
        params.require(:meeting).permit(:title, :description, :time, :category, :subcategory)
    end

end
