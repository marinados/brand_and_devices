class Category < ActiveRecord::Base
  has_many :devices

  def to_s
    label
  end
end
