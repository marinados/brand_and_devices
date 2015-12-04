class Device < ActiveRecord::Base
  has_many :devices_users
  has_many :users, through: :devices_users
  belongs_to :category
end