Feature: create a new group
  As an admin
  So that I can email the correct groups of people
  I want to be able to create new groups
  
#Assuming that we have a home page that lists all groups
Scenario: Add new group
  Given I am on the home page
  Then I should not see "ACM Club"
  When I follow "Create a group"
  Then I should be on the create group page
  When I fill in "Title" with "ACM Club"
  When I press "Confirm"
  Then I should be on the home page
  Then I should see "ACM Club"
  
Scenario: Cancel creation of a new group
  Given I am on the home page
  Then I should not see "ACM Club"
  When I follow "Create a group"
  Then I should be on the create group page
  When I fill in "Title" with "ACM Club"
  When I press "Cancel"
  Then I should be on the home page
  Then I should not see "ACM Club"
