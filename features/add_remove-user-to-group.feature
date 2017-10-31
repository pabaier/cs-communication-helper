Feature: Add user to group
  As an admin
  So that I can organize students
  I want to be able to check a box for each group
  
Scenario: Check box to subscribe to group
  Given I am on the student details page
  When I check "ACM"
  #When I follow "Save"
  #Then I should be on the student details page
  Then the "ACM" checkbox should be checked
  
Scenario: Uncheck box to subscribe to group
  Given I am on the student details page
  When I uncheck "ACM"
  #When I follow "Save"
  #Then I should be on the student details page
  Then the "ACM" checkbox should not be checked

