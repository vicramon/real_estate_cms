class Admin::BlocksController < AdminController
  expose(:block)

  def destroy
    block.destroy if current_user.admin_for(block.page.site)
    redirect_to [:edit, :admin, block.page]
  end

end
