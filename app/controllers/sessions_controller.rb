class SessionsController < ApplicationController
  expose(:site) { current_site }
  expose(:user) { User.find_by_email(params[:email]) }
  layout 'pages'

  def create
    if user && user.authenticate(params[:password])
      sign_in(user)
      choose_redirect(user)
    else
      flash.alert = "Your email and password do not match."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end

  private

  def choose_redirect(user)
    if user.super_admin?
      redirect_to super_admin_index_path
    elsif user.admin_for(site)
      redirect_to [:dashboard, :index]
    else
      redirect_to :root
    end
  end

end
