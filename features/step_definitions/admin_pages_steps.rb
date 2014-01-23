Given(/^I am signed in as an admin$/) do
  steps %{
    Given I am a site admin
    When I visit the sign in path for my site
    And I fill out the sign in form
  }
end

Given(/^I have 2 pages$/) do
  Fabricate(:page, name: "Home", site: @site)
  Fabricate(:page, name: "About", site: @site)
end

Given(/^I have 1 page$/) do
  @page = Fabricate(:page, name: "Home", site: @site)
end

Then(/^I should see those pages$/) do
  expect(page).to have_content "Home"
  expect(page).to have_content "About"
end

When(/^I fill in the page form$/) do
  fill_in "Name:", with: "Company"
  submit_form
end

Then(/^I should see that my page is persisted$/) do
  Page.last.name.should == "Company"
  Page.last.site.should == @site
end

When(/^I click to edit the first page$/) do
  all('a', text: 'edit').first.click
end

Then 'I should see that my page is updated' do
  @page.reload.name.should == "Company"
end

When(/^I click to delete the first page$/) do
  all('a', text: 'delete').first.click
end

Then 'I should see that my page is deleted' do
  current_path.should == admin_pages_path
  page.should_not have_content "Home"
end
