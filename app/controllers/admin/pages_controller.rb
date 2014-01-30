class Admin::PagesController < AdminController
  expose(:pages) { site.ordered_pages }
  expose(:page, finder: :find_by_slug, attributes: :page_params)

  def create
    page.save
    redirect_to edit_admin_page_path(page), notice: 'save'
  end
  alias update create

  def show; render :edit; end

  def destroy
    page.destroy
    redirect_to admin_pages_path, notice: 'save'
  end

  def update_order
    site.update_attributes(site_params)
    redirect_to reorder_admin_pages_path, notice: 'save'
  end

  private

  def page_params
    params.require(:page).permit(
      :name,
      :header,
      blocks_attributes: [:id,
                          :header,
                          :subheader,
                          :text,
                          :image_url,
                          :image_align]
    )
  end

  def site_params
    params.require(:site).permit(pages_attributes: [:id, :position])
  end
end
