class Site < ActiveRecord::Base
  has_many :users
  scope :ordered, -> { order(:name) }
end
