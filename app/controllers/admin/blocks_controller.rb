class Admin::BlocksController < AdminController
  expose(:page) { current_site.pages.find_by_slug(params[:page_id]) }
  expose(:block, attributes: :block_params)

  def create
    block.save
    redirect_to edit_admin_page_path(page), notice: 'save'
  end

  def destroy
    block.destroy
    redirect_to [:edit, :admin, block.page]
  end

  def update_order
    page.update_attributes(page_params)
    redirect_to reorder_admin_page_blocks_path(page), notice: 'save'
  end

  private

  def block_params
    params.require(:block).permit(:header, :subheader, :text,
      :image_url, :image_align, :page_id)
  end

  def page_params
    params.require(:page).permit(blocks_attributes: [:id, :position])
  end

end
