class DeviceProfile
  def initialize(device:)
    @device = device
  end

  def list_all_triggers
    [@device, @device.devices_users.to_a, @device.updates.to_a, @device.requests.to_a].flatten.sort {|a, b| a.created_at <=> b.created_at }
  end
end