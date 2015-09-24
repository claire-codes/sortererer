Feature: User uses site

	# Scenario: Click button Hello World
	# Given I am on the sorterer page
	# Then I should not see 'Hello World'
	# When I click the 'submit-list' button
	# Then I should see 'Hello World'

	Scenario: Send some data off alright
	Given I am on the sorterer page
	When I enter "foo\nbar" in the list box
	And I click the 'submit-list' button
	Then I should see 'bar\nfoo' in the list box
	And I should see 'Sorted!'