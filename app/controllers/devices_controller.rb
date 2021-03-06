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
    @updates = @device.updates
    @all_users = @device.users
    @current_user = @all_users.present? && @device.devices_users.order(created_at: :desc).first.user.present? ? @device.devices_users.order(created_at: :desc).first.user : 'personne'
    @timeline = DeviceProfile.new(@device).list_all_triggers
  end

  def index
    @devices = Device.all
  end

  def search
    if params[:search].blank?
      @devices = Device.all
    else
      @results = PgSearch.multisearch(params[:search])
      @devices = []
      @results.each do |result|
        if result.searchable_type == 'Device'
          Device.where("name ILIKE ?", "%#{result.content}%").each do |device|
            @devices << device
          end
        elsif result.searchable_type == 'User'
          User.where("name ILIKE ?", "%#{result.content}%").first.devices.each do |device|
            @devices << device
          end
        end
      end
    end
    respond_to do |format|
      format.html { render 'devices/index' }
      format.js
    end
  end

  private

  def set_params_device
    params.require(:device).permit(:name, :description, :category_id, :series)
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
