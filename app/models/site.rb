class Site < ActiveRecord::Base
  include ::SiteDecorator
  has_many :users
  has_many :pages
  scope :ordered, -> { order(:name) }

  accepts_nested_attributes_for :pages

  def ordered_pages
    pages.ordered
  end

end
