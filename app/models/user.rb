class User < ActiveRecord::Base
  has_many :devices_users
  has_many :devices, through: :devices_users
  has_many :requests

  include PgSearch
  pg_search_scope :search_by_name, against: [ :name ]

  def to_s
    name
  end
end
