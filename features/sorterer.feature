Feature: User uses site

	Scenario: Click button Hello World
	Given I am on the sorterer page
	When I click the submit button
	Then I should see 'Hello World'