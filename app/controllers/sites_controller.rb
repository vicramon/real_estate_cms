class SitesController < SuperAdminController
  expose(:sites)
  expose(:site, attributes: :site_params)

  def create
    site.save
    redirect_to [:edit, site]
  end
  alias update create

  def show; render :edit; end

  private

  def site_params
    params.require(:site).permit!
  end

end
