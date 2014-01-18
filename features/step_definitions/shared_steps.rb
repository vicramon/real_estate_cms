def click_submit
  find("input[type='submit']").click
end

When(/^I follow "(.*?)"$/) do |text|
  click_link text
end
