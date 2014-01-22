class Admin::PagesController < AdminController
  expose(:pages) { site.pages }
  expose(:page)
end
