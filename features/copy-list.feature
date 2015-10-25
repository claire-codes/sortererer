Feature: User wants to copy their newly sorted list to their clipboard

	Scenario: User clicks the copy button to copy the sorted list to their clipboard
	Given I visit the List Sorter app
	When I enter "igloo,jam,hamster" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "hamster,igloo,jam" in the sorted box
	And I should see 'Sorted!'
	When I click the 'Copy' button
	Then the sorted list "hamster,igloo,jam" should be copied to my clipboard
	And I should see 'Copied!'