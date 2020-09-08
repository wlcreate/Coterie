class MeetingsController < ApplicationController

    before_action :get_meeting, only: [:show, :edit, :update, :destroy]

    def index
        @meetings = Meeting.all
    end
    
    def new
        @categories = Category.all
        @meeting = Meeting.new
    end

    def get_category
        # cat_selected = params[:meeting][:category_id]
        # @categories = Category.all
        # @category = Category.find_by_id(cat_selected)
        @meeting = Meeting.create(meeting_params)
        redirect_to meeting_form_path(@meeting)
    end





    def meeting_form
        @category = Category.find_by(id: params[:id])
    end






    def create
    byebug
    @meeting = Meeting.create(meeting_params)
    end





    def create_subcat
        @categories = Category.all
        @subcategories = Subcategory.all
        @meeting = Meeting.create(meeting_params)
        @meeting[:user_id] = @current_user.id
        ##### why isn't meeting being saved in the database???
        ##### once the issue is fixed //next step:
        ##### register the host as an attendee to the meeting
        ##### Registration.new(:meeting_id = @meeting.id, user_id = @current_user.id)
        redirect_to meeting_path(@meeting)
    end






    def show
    end




    private



    def get_meeting
        @meeting = Meeting.find(params[:id])
    end



    
    def meeting_params
        params.require(:meeting).permit(:title, :description, :time, :category)
    end

end
