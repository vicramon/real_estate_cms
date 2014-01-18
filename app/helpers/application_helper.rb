module ApplicationHelper

  def not_on_super_admin_dashboard
    request.path != "/super_admin"
  end

end
