class PagesController < ApplicationController
  expose(:site) { current_site }
  expose(:page, finder: :find_by_slug)
  expose(:blocks) { page.blocks.ordered }

  def show
    self.page = site.pages.find_by_slug(params[:path]) if page.id.nil?
    self.page = site.pages.ordered.first if page.nil?
  end

end
