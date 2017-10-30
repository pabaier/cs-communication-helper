Feature: add user to group
  As an admin
  So that I can organize students
  I want to be able to add a student to a specific group
  
Scenario: add student to group
  Given I am on the student details page
  When I check "ACM"
  Then the "ACM" checkbox should be checked
  
Scenario: unsubscribe student from group
  Given I am on the student details page
  When I uncheck "ACM"
  Then the "ACM" checkbox should not be checked

