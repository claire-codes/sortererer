Feature: User wants to sort with standard ASCII order, so A-Z comes before a-z

	Scenario: User is stupid and wants standard ASCII sort instead of case insensitive
	Given I visit the List Sorter app
	When I enter "Apples,apples,bananas,Bananas,Cucumbers,cucumbers" in the unsorted box
	And I select the "ascii" option
	And I wait 20 seconds
	And I click the 'submit-list' button
	Then I should see "Apples,Bananas,Cucumbers,apples,bananas,cucumbers" in the sorted box
	And I should see 'Sorted!'

	Scenario: User wants a reversed, ASCII sorted list
	Given I visit the List Sorter app
	When I enter "apples,Cucumbers,Bananas,bananas,cucumbers" in the unsorted box
	And I select the "reverse" option
	And I select the "ascii" option
	And I click the 'submit-list' button
	Then I should see "cucumbers,bananas,apples,Cucumbers,Bananas" in the sorted box
	And I should see 'Sorted!'