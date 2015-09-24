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

When(/^I enter (.*) in the list box$/) do |list|
	page.fill_in 'list-input', :with => list
end

Then(/^I should see '(.*)' in the list box$/) do |list|
  find('#list-input').text should eq list
end