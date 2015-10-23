Feature: User wants a reverse sorted list, because they're backwards

	Scenario: User wants a reverse sorted list, no extra options
	Given I visit the List Sorter app
	When I enter "apples,bananas,cucumbers" in the unsorted box
	And I select the "reverse" option
	And I click the 'submit-list' button
	Then I should see "cucumbers,bananas,apples" in the sorted box
	And I should see 'Sorted!'

	Scenario: User wants a reverse sorted list with ASCII ordering
	Given I visit the List Sorter app
	When I enter "apples,Cucumbers,Bananas,bananas,cucumbers" in the unsorted box
	And I select the "reverse" option
	And I select the "ascii" option
	And I click the 'submit-list' button
	Then I should see "cucumbers,bananas,apples,Cucumbers,Bananas" in the sorted box
	And I should see 'Sorted!'