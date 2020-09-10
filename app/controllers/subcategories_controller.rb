class SubcategoriesController < ApplicationController
    before_action :get_subcategory, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized_to_see_page, only: [:show]

def show
    @category = @subcategory.category
    @meetings = @subcategory.meetings
end

private

def get_subcategory
    @subcategory = Subcategory.find(params[:id])
end


end
