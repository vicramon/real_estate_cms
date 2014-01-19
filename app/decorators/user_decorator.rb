module UserDecorator

  def name
    "#{first_name} #{last_name}"
  end

  def pretty_site
    site.try(:name)
  end

end
