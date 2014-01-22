module SiteDecorator

  def city_state_zip
    "#{city}, #{state} #{zip}"
  end

  def twitter_url
    "http://twitter.com/#{twitter}" if twitter.present?
  end

end
