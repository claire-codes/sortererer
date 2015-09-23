Feature: User uses site

	Scenario: Click button Hello World
	Given I am on the sorterer page
	Then I should not see 'Hello World'
	When I click the 'submit-list' button
	Then I should see 'Hello World'