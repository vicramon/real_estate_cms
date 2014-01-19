class AdminController < ApplicationController
  before_filter :require_site_admin
  layout 'pages'
  expose(:site) { current_site }

  def index
  end

  private

  def require_site_admin
    unless site_admin_or_super_admin
      redirect_to :sign_in
    end
  end

  def site_admin_or_super_admin
    current_user && (current_user.admin_for(current_site) or current_user.super_admin?)
  end

end
