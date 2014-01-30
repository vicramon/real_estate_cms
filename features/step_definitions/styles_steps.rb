Then(/^I should see that the custom stylesheet is loaded$/) do
  all("link").instance_variable_get(:@elements).last['href'].
    should == "/assets/sites/#{@site.stylesheet_name}.css"
end
