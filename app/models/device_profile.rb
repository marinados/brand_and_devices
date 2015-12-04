class DeviceProfile
  def initialize(device)
    @device = device
  end

  def list_all_triggers
    array = [
      @device, @device.devices_users.to_a,
      @device.updates.to_a, @device.requests.to_a
    ].flatten.sort { |b, a| a.created_at <=> b.created_at }
    array.map { |trigger| HistoryTrigger.new(trigger).translate_to_human }
  end
end