class SubcategoriesController < ApplicationController
    before_action :get_subcategory, only: [:show, :edit, :update, :destroy]

def show
    @category = @subcategory.category
    @meetings = @subcategory.meetings
end

private

def get_subcategory
    @subcategory = Subcategory.find(params[:id])
end


end
