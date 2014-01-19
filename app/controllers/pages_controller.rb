class PagesController < ApplicationController
  expose(:site) { current_site }
end
