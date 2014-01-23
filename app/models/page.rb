class Page < ActiveRecord::Base
  belongs_to :site
  scope :ordered, -> { order(:position) }

  before_save do
    self.slug = self.name.parameterize
  end

  def to_param; slug; end

end
