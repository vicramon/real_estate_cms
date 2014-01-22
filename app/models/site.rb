class Site < ActiveRecord::Base
  include ::SiteDecorator
  has_many :users
  has_many :pages
  scope :ordered, -> { order(:name) }
end
