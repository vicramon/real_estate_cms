Given(/^I am signed in as a super admin$/) do
  steps %{
    Given there is a super admin
    When I log in with valid super admin credentials
    Then I should be on the super admin dashboard
  }
end

When(/^I click to create a new site$/) do
  click_link "Create New Site"
end

When(/^I fill in and submit the site form$/) do
  fill_in "Name:", with: 'Green Forest Realty'
  fill_in "Domain:", with: 'localhost:3000'
  click_submit
end

Then(/^I should see my newly created site$/) do
  page.current_path.should == edit_site_path(Site.last)
end

Given(/^there is a site$/) do
  @site = Fabricate(:site, name: 'Black Forest Realty')
end

When(/^I go to edit that site$/) do
  visit edit_site_path(@site)
end

Then(/^I should see that my changes are saved$/) do
  Site.last.name.should == 'Green Forest Realty'
end
