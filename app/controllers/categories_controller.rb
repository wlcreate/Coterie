class CategoriesController < ApplicationController

    def index
        @categories = Category.all
        @subcategories = Subcategory.all 
        @meetings = Meeting.all
    end

end
