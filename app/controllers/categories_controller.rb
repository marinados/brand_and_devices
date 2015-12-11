class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(set_category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @devices = @category.devices
  end

  def index
    @categories = Category.all
  end

  private

  def set_category_params
    params.require(:category).permit(:label)
  end
end
