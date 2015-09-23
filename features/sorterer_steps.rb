include Rack::Test::Methods

Given(/^I am on the sorterer page$/) do
  visit "/hi"
end

When(/^I click the '(.*)' button$/) do |button|
  click_button(button)
end

Then(/^I should see '(.*)'$/) do |text|
  page.should have_content text
end

Then(/^I should not see '(.*)'$/) do |text|
  page.should_not have_content text
end