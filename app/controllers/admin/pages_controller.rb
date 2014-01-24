class Admin::PagesController < AdminController
  expose(:pages) { site.ordered_pages }
  expose(:page, finder: :find_by_slug, attributes: :page_params)

  def create
    page.save
    redirect_to edit_admin_page_path(page)
  end
  alias update create

  def show; render :edit; end

  def destroy
    page.destroy
    redirect_to admin_pages_path
  end

  def update_order
    site.update_attributes(site_params)
    redirect_to reorder_admin_pages_path
  end

  private

  def page_params
    params.require(:page).permit(:name)
  end

  def site_params
    params.require(:site).permit(pages_attributes: [:id, :position])
  end
end
