Feature: Add a student
  As an admin
  So that I can contact a student
  I want to add a student to the communication helper database

Scenario: Add new student
Given that I am on the create student page
When I fill in “Name” with “John Smith”
And I fill in “Email” with “jsmith123@citadel.edu”
And I fill in “Graduation Year” with “2020”
And I fill in “Status” with “student”
And I check Group A
And I check Group B 
And I press “Confirm”
Then I should see “John Smith”