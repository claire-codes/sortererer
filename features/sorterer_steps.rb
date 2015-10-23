include Rack::Test::Methods

Given(/^I visit the List Sorter app$/) do
  visit "/"
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
	textarea = find(:css, '#list-input')
	list.split(',').each do |item|
		textarea.send_keys(item)
		textarea.native.send_key(:enter)
	end
	# TODO: Maybe not do return on last one?
end

Then(/^I should see "(.*)" in the list box$/) do |list|
	textarea = find(:css, '#list-input').value
	textarea_array = textarea.split("\n")
	split_list = list.split(',')
	expect(textarea_array).to eq(split_list)
end

And(/^I wait (\d+) seconds?$/) do |seconds|
	sleep seconds.to_i
end

When(/^I enter "([^"]*)" in the unsorted box$/) do |list|
  textarea = find(:css, '#unsorted-list-input')
	list.split(',').each do |item|
		textarea.send_keys(item)
		textarea.native.send_key(:enter)
	end
end

When(/^I enter "([^"]*)" in the sorted box$/) do |list|
  textarea = find(:css, '#sorted-list-output')
	list.split(',').each do |item|
		textarea.send_keys(item)
		textarea.native.send_key(:enter)
	end
end

Then(/^I should see "([^"]*)" in the sorted box$/) do |list|
	textarea = find(:css, '#sorted-list-output').value
	textarea_array = textarea.split("\n")
	split_list = list.split(',')
	expect(textarea_array).to eq(split_list)
end

Then(/^"([^"]*)" should be copied to my clipboard$/) do |list|
	# Test by copying pasting list into unsorted box
  	elem = find(:css, '#sorted-list-output')
	elem.send_keys(:control, 'a') #highlight all in box
	elem.send_keys(:control, 'c')

	textarea = find(:css, '#unsorted-list-input')
	textarea.send_keys(:control, 'a')
	textarea.send_keys(:control, 'v')

	textarea_array = textarea.value.split("\n")
	expected_list = list.split(',')
	expect(textarea_array).to eq(expected_list)
end