Feature: User uses app to sort a list

	Scenario: An already sorted list should remain the same
	Given I visit the List Sorter app
	When I enter "apples,bananas,cucumbers" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "apples,bananas,cucumbers" in the sorted box
	And I should see 'Sorted!'

	Scenario: A very simple unsorted list is sorted and returned to the textarea box
	Given I visit the List Sorter app
	When I enter "foo,bar" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "bar,foo" in the sorted box
	And I should see 'Sorted!'

	Scenario: A longer unsorted list is sorted and returned to the textarea box
	Given I visit the List Sorter app
	When I enter "foo,bar,baz,alice,babs,bob" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "alice,babs,bar,baz,bob,foo" in the sorted box
	And I should see 'Sorted!'

	Scenario: A longer mixed-case unsorted list is sorted and returned to the textarea box
	Given I visit the List Sorter app
	When I enter "foo,bar,baz,Alice,Babs,Bob" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "Alice,Babs,bar,baz,Bob,foo" in the sorted box
	And I should see 'Sorted!'

	Scenario: A mixed-case unsorted list is sorted and returned to the textarea box
	Given I visit the List Sorter app
	When I enter "Apple,apple,cat,Cat,Chicken,chicken" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "Apple","apple","cat","Cat","Chicken","chicken" in the sorted box
	And I should see 'Sorted!'