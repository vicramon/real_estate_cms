class Block < ActiveRecord::Base
  belongs_to :page
  scope :ordered, -> { order(:position) }
end
