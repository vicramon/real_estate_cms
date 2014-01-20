class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Authem::ControllerSupport

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def current_site
    if Rails.env.test?
      Site.first
    else
      Site.find_by_domain(request.domain)
    end
  end

end
