Given(/^there is a super admin$/) do
  @user = Fabricate(:super_admin)
end

When(/^I log in with valid super admin credentials$/) do
  visit sign_in_path
  fill_in :email, with: @user.email
  fill_in :password, with: 'password'
  click_button 'Sign In'
end

Then(/^I should be on the super admin dashboard$/) do
  current_path.should == super_admin_index_path
end
