class CategoriesController < ApplicationController

    skip_before_action :authorized_to_see_page, only: [:index]

    def index
        @categories = Category.all
        @subcategories = Subcategory.all 
        @meetings = Meeting.all
    end



end
