include Rack::Test::Methods

Given(/^I am on the sorterer page$/) do
  visit "/hi"
end

When(/^I click the "(.*)" button$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*)"$/) do |text|
  pending # Write code here that turns the phrase above into concrete actions
end