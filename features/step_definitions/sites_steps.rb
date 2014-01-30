When(/^I visit that site's domain$/) do
  visit '/'
end

Then(/^I should see that site's street address in the footer$/) do
  within "footer" do
    expect(page).to have_content @site.address
  end
end
