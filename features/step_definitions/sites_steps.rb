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

Given(/^there are 2 sites$/) do
  @site1 = Fabricate(:site, name: 'Black Forest')
  @site2 = Fabricate(:site, name: 'Green Forest')
end

Then(/^I should see those sites$/) do
  expect(page).to have_content @site1.name
  expect(page).to have_content @site2.name
end

When(/^I click to delete the first site$/) do
  all("a.delete").first.click
end

Then(/^that site should be deleted$/) do
  page.should_not have_content @site1.name
end
