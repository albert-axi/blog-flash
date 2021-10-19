class CategoriesController < ApplicationController
  layout "admin"
  def index
    @categories = Category.all
  end

  def show
    @category= Category.find(params[:id])
  end
end
