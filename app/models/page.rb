class Page < ActiveRecord::Base
  belongs_to :site
  has_many :blocks, dependent: :destroy
  scope :ordered, -> { order(:position) }
  accepts_nested_attributes_for :blocks
  include ::PageDecorator

  before_save do
    self.slug = self.name.parameterize
  end

  def to_param; slug; end

end
