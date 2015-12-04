class DevicesController < ApplicationController
  def new
    set_new_variables
  end

  def create
    @device = Device.new(set_params_device)
    if @device.save
      @device.devices_users.create(user: User.find(params[:device][:users]))
      redirect_to devices_path
    else
      set_new_variables
      render 'new'
    end
  end

  def edit
    set_device
  end

  def update
    set_device
    link = @device.devices_users.new(user: User.find(params[:device][:users]))
    if link.save
      redirect_to device_path(@device)
    else
      set_new_variables
      render 'edit'
    end
  end

  def show
    set_device
  end

  def index
    @devices = Device.all
  end

  private

  def set_params_device
    params.require(:device).permit(:name, :description, :category_id)
  end

  def set_new_variables
    @device = Device.new
    @users = User.all
    @categories = Category.all
  end

  def set_device
    @device = Device.find(params[:id])
  end
end