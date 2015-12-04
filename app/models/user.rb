class User < ActiveRecord::Base
  has_many :devices_users
  has_many :devices, through: :devices_users
  has_many :requests

  include PgSearch
  multisearchable against: :name

  def to_s
    name
  end
end
