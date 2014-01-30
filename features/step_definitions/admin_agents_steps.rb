Given(/^I have 1 agent$/) do
  Fabricate(:user, first_name: 'Joe', site: @site,
    last_name: 'Namath', email: 'namath@example.com')
end

Then(/^I should see my list of agents$/) do
  page.should have_content "Joe Namath"
  page.should have_content "Joe Cool"
end

When(/^I fill out the agent form$/) do
  fill_in "First Name:", with: "Harry"
  fill_in "Last Name:", with: "Potter"
  click_submit
end

When(/^I make changes to that agent$/) do
  fill_in "First Name:", with: "Some"
  fill_in "Last Name:", with: "Dude"
  click_submit
end

Then(/^I should see that my agent is added$/) do
  click_link "Agents"
  page.should have_content "Harry Potter"
end

When(/^I click to edit an agent$/) do
  all("a", text: 'edit')[1].click
end

Then(/^I should see that my agent is edited$/) do
  click_link "Agents"
  page.should have_content 'Some Dude'
end

When(/^I click to delete an agent$/) do
  all('a', text: 'delete')[2].click
end

Then(/^I should see that my agent is deleted$/) do
  page.should_not have_content "Some Dude"
end
