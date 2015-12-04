class UpdatesController < ApplicationController
  def new
    set_device
    @update = @device.updates.new
  end

  def create
    set_device
    @update = @device.updates.create(set_params)
    redirect_to device_path(@device)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
    @update = @device.updates.new
  end

  def set_params
    params.require(:update).permit(:comment)
  end
end
