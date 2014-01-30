class Admin::AgentsController < AdminController
  expose(:agents) { site.users.ordered }
  expose(:agent, model: :user, attributes: :agent_params)

  def create
    full_params = agent_params.merge(password: 'password',
                  password_confirmation: 'password',
                  email: random_email, site_id: current_site.id )
    agent.update_attributes(full_params)
    redirect_to edit_admin_agent_path(agent), notice: 'save'
  end

  def update
    agent.save
    redirect_to edit_admin_agent_path(agent), notice: 'save'
  end

  def show; render :edit; end

  def destroy
    agent.destroy
    redirect_to admin_agents_path, notice: 'save'
  end

  private

  def agent_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :title,
      :bio,
      :image_url)
  end

  def random_email
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join + "@example.com"
  end

end
