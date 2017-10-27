Feature: create a new group
  As an admin
  So that I can email the correct groups of people
  I want to be able to create new groups
  
Scenario: Add new group
  Given that I am on the create group page
  When I fill in group_name with "ACM Club"
  When I press "Confirm"
  Then I should be on the home page
  Then I should see "ACM Club"
  
Scenario: Cancel creation of a new group
  Given that I am on the create group page
  When I fill in group_name with "ACM Club"
  When I press "Cancel"
  Then I should be on the home page
  Then I should not see "ACM Club"
