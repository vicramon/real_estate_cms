def refresh_page
  visit current_path
end

def click_submit
  find("input[type='submit']").click
end
alias submit_form click_submit

When(/^I submit the form$/) do
  click_submit
end

When(/^I follow "(.*?)"$/) do |text|
  click_link text
end

When(/^I visit that site$/) do
  visit '/'
end

Given(/^I am a site admin$/) do
  @site = Fabricate(:site)
  @user = Fabricate(:admin, site: @site)
end
