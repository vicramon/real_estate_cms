class User < ActiveRecord::Base
  include Authem::User
  include ::UserDecorator
  belongs_to :site
  scope :ordered, -> { order("lower(first_name), lower(last_name)") }
end
