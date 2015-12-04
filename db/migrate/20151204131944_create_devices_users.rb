class CreateDevicesUsers < ActiveRecord::Migration
  def change
    create_table :devices_users do |t|
      t.belongs_to :device, index: true
      t.belongs_to :user, index: true
    end
  end
end
