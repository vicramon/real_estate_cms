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

Then(/^I should see those pages$/) do
  expect(page).to have_content "Home"
  expect(page).to have_content "About"
end
