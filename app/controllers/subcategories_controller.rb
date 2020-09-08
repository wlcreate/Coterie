class SubcategoriesController < ApplicationController

def index
    @subcategories = Subcategory.all 
    @categories = Category.all
    @meetings = Meeting.all
end

end
