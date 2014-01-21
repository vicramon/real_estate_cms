class Site < ActiveRecord::Base
  include ::SiteDecorator
  has_many :users
  scope :ordered, -> { order(:name) }
end
