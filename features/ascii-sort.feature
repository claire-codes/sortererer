Feature: User wants to sort with standard ASCII order, so A-Z comes before a-z

	Scenario: User is stupid and wants standard ASCII sort instead of case insensitive
	Given I visit the List Sorter app
	When I enter "Apples,apples,bananas,Bananas,Cucumbers,cucumbers" in the unsorted box
	And I select the "ascii" option
	And I click the 'submit-list' button
	Then I should see "Apples,Bananas,Cucumbers,apples,bananas,cucumbers" in the sorted box
	And I should see 'Sorted!'