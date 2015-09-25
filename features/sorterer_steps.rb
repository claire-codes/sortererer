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

When(/^I enter "(.*)" in the list box$/) do |list|
	# page.fill_in 'list-input', :with => list
	textarea = find(:css, '#list-input')
	list.split(',').each do |item|
		textarea.send_keys(item)
		textarea.native.send_key(:enter)
	end
	# TODO: Maybe not do return on last one?
end

Then(/^I should see '(.*)' in the list box$/) do |list|
	puts 'Bananas'
	entry =  find(:css, '#list-input').value
	puts 'Bananas'
	puts find(:css, '#list-input').text
	puts 'Bananas'
	expect(find(:css, '#list-input').value).to eq(list)
end

And(/^I wait (\d+) seconds?$/) do |seconds|
	sleep seconds.to_i
end