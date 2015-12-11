class Device < ActiveRecord::Base
  has_many :devices_users
  has_many :users, through: :devices_users
  has_many :updates
  has_many :requests
  belongs_to :category

  include PgSearch
  multisearchable against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  def to_s
    name
  end
end
