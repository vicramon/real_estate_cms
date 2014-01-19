def click_submit
  find("input[type='submit']").click
end
alias submit_form click_submit

When(/^I follow "(.*?)"$/) do |text|
  click_link text
end
