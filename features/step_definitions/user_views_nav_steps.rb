Given(/^a site with pages$/) do
  @site = Fabricate(:site)
  %w(Home Buyers Sellers Contact).each_with_index do |name, index|
    Fabricate(:page, name: name, site: @site, position: index)
  end
end

Then(/^I should see the pages in the nav$/) do
  %w(Home Buyers Sellers Contact).each do |name|
    find('nav#top a', text: name)
  end
end

Then(/^I should see the pages in the footer$/) do
  %w(Home Buyers Sellers Contact).each do |name|
    find('footer a', text: name)
  end
end
