class SuperAdminController < ApplicationController
  before_filter :require_super_admin

  private

  def require_super_admin
    redirect_to :sign_in unless current_user and current_user.super_admin?
  end

end
