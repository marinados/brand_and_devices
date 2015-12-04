class Device < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :category
end