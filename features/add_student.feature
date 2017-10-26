Feature: Add a student
Given that I am on the create student page

Scenario: Add new student
When I fill in “Name” with “John Smith”
When I fill in “Email” with “jsmith123@citadel.edu”
When I fill in “Graduation Year” with “2020”
When I fill in “Status” with “student”
When I check Group A
When I check Group B 
When I press “Confirm”
Then I should see “John Smith”