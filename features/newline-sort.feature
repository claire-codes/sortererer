Feature: User sometimes wants to preserve whitespace and newlines in sort, sometimes doesn't

	Scenario: User experiences default behaviour: newlines are stripped
	Given I visit the List Sorter app
	When I enter ",apple,,turkey,,lion," in the unsorted box
	And I click the 'submit-list' button
	Then I should see "apple,lion,turkey" in the sorted box
	And I should see 'Sorted!'

	Scenario: User puts lines with whitespace in, which are also stripped
	Given I visit the List Sorter app
	When I enter "  ,crisps,chocolate,	,peanuts" in the unsorted box
	And I click the 'submit-list' button
	Then I should see "chocolate,crisps,peanuts" in the sorted box
	And I should see 'Sorted!'

	Scenario: User just enters blank lines because they are stupid
	Given I visit the List Sorter app
	When I enter ",,," in the unsorted box
	And I click the 'submit-list' button
	Then I should see "" in the sorted box
	And I should see 'Sorted!'

	Scenario: User enters lines with just whitespace because they are still stupid
	Given I visit the List Sorter app
	When I enter "  ,,   , ,	,," in the unsorted box
	And I click the 'submit-list' button
	Then I should see "" in the sorted box
	And I should see 'Sorted!'