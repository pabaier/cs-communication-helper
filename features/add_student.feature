Feature: Add a student
  As an admin
  So that I can contact a student
  I want to add a student to the communication helper database

Scenario: Add new student
  Given I am on the create student page
  When I fill in "First Name" with "John"
  And I fill in "Last Name" with "Smith"
  And I fill in "Email" with "123@citadel.edu"
  And I choose "3-May-2020" in "Graduation Date"
  And I select "Student" from "Status"
  And I press "Confirm"
  Then I should see "123@citadel.edu"