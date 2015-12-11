class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to user_path(@user)
    else
      @user = User.new
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @devices = @user.devices.reject do |device|
      dates = device.devices_users.pluck(:created_at).map do |date|
        date > device.devices_users.where(user: @user).last.created_at
      end
      dates.any?
    end
  end

  def index
    @users = User.all
  end

  private

  def set_params
    params.require(:user).permit(:name, :email)
  end
end
