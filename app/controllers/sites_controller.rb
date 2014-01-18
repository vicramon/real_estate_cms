class SitesController < SuperAdminController
  expose(:sites)
  expose(:site, attributes: :site_params)

  def create
    site.save
    redirect_to [:edit, site]
  end
  alias update create

  def show; render :edit; end

  def destroy
    site.destroy
    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit!
  end

end
