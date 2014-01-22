Given(/^I am a site admin$/) do
  @site = Fabricate(:site)
  @user = Fabricate(:admin, site: @site)
end

When(/^I visit the sign in path for my site$/) do
  visit '/admin'
end

When(/^I fill out the sign in form$/) do
  fill_in "Email:", with: @user.email
  fill_in "Password:", with: @user.password
  submit_form
end

Then(/^I should be on my site's dashboard$/) do
  expect(page).to have_content 'Dashboard'
end
