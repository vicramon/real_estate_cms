class PagesController < ApplicationController
  expose(:site) { current_site }
  expose(:page, finder: :find_by_slug)
end
