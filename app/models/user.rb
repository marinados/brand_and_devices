class User < ActiveRecord::Base
  has_many :devices_users
  has_many :devices, through: :devices_users

  def to_s
    name
  end
end