When(/^I fill out the user form$/) do
  fill_in "First Name:", with: "Sam"
  fill_in "Last Name:", with: "Bo"
  fill_in "Email:", with: "sambo@example.com"
  fill_in "Password:", with: "password"
  select Site.first.name, from: "Site:"
  find("#user_admin").set(true)
  find("#user_super_admin").set(false)
  submit_form
end

Then(/^I should see my newly created user$/) do
  user = User.last
  user.name.should == "Sam Bo"
  user.email.should == "sambo@example.com"
  user.site.should == Site.first
  user.admin?.should be_true
  user.super_admin?.should be_false
end

Then(/^the changes to that user should be saved$/) do
  step "I should see my newly created user"
end

Given(/^there are (\d+) users$/) do |arg1|
  @user1 = Fabricate(:user, email: 'bob@example.com')
  @user2 = Fabricate(:user, email: 'kevin@example.com')
end

Then(/^I should see those users$/) do
  expect(page).to have_content @user1.name
  expect(page).to have_content @user2.name
end

When(/^I click to delete the first user$/) do
  all("a.delete").first.click
end

Then(/^that user should be deleted$/) do
  User.count.should == 2
end
