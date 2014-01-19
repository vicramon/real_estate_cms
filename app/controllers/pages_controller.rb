class PagesController < ApplicationController
  expose(:site) { Site.find_by_domain(request.domain) }
end
