Given(/^there is a site with a page with blocks$/) do
  @site = Fabricate(:site, name: 'My Site')
  @page = Fabricate(:page, name: 'My Page', site: @site)
  @block1 = Fabricate(:block, header: 'My header', subheader: 'My subheader',
            text: 'My text', page: @page)
  @block2 = Fabricate(:block, header: 'My other header', subheader: 'My subheader',
            text: 'My text', page: @page)
end

When(/^I visit a page with blocks$/) do
  visit '/my-page'
end

Then(/^I should see those blocks$/) do
  page.should have_content 'My header'
  page.should have_content 'My subheader'
  page.should have_content 'My text'
  page.should have_content 'My other header'
end
