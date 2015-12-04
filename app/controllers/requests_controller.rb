class RequestsController < ApplicationController
  def new
    set_variables
  end

  def create
    @request = Request.new(set_params)
    if @request.save
      redirect_to requests_path
    else
      set_variables
      render 'new'
    end
  end

  def index
    @requests = Request.all
  end

  private

  def set_variables
    @request = Request.new
    @users = User.all
    @devices = Device.all
  end

  def set_params
    params.require(:request).permit(:user_id, :device_id, :end_date)
  end
end
