class DevicesController < ApplicationController
  def new
    @device = Device.new
    @users = User.all
  end

  def create
    @device = Device.new(set_params_device)
  end

  def show
  end

  def index
  end

  private

  def set_params_device
    params.require(:device).permit(:name, :description, :user)
  end
end