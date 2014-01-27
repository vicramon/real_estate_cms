class Admin::BlocksController < AdminController
  expose(:page, finder: :find_by_slug)
  expose(:block, attributes: :block_params)

  def create
    block.save
    redirect_to edit_admin_page_path(page), notice: 'save'
  end

  def destroy
    block.destroy
    redirect_to [:edit, :admin, block.page]
  end

  private

  def block_params
    params.require(:block).permit(:header, :subheader, :text,
      :image_url, :image_align, :page_id)
  end

end
