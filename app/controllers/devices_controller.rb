class DevicesController < ApplicationController
  def new
    set_new_variables
  end

  def create
    @device = Device.new(set_params_device)
    if @device.save
      @device.devices_users.create(user: User.find(params[:device][:users]))
      redirect_to device_path(@device)
    else
      set_new_variables
      render 'new'
    end
  end

  def edit
    set_device
    @devices_user = @device.devices_users.new
    @users = User.all
  end

  def update
    set_device
    link = @device.devices_users.new(
      user: User.find(params[:devices_user][:user_id])
    )
    if link.save
      redirect_to device_path(@device)
    else
      set_new_variables
      render 'edit'
    end
  end

  def show
    set_device
    @last_user = DevicesUser.where(device: @device).order("updated_at")
    @updates = @device.updates
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
