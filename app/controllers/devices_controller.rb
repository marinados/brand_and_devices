class DevicesController < ApplicationController
  def new
    @device = Device.new
    @users = User.all.map(&:name)
    @category_names = Category.all.map(&:label)
  end

  def create
    @device = Device.new(set_params_device)
  end

  def show
    @device = Device.find(params[:id])
  end

  def index
    @devices = Device.all
  end

  private

  def set_params_device
    params.require(:device).permit(:name, :description, :category, :user)
  end
end
