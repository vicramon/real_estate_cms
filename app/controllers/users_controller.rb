class UsersController < SuperAdminController
  expose(:sites) { Site.ordered }
  expose(:users) { User.ordered }
  expose(:user, attributes: :user_params)

  def create
    user.save
    redirect_to user
  end
  alias update create

  def show; render :edit; end

  def destroy
    user.destroy
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit!.merge(password_confirmation: params[:user][:password])
  end

end
