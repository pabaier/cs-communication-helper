Feature: Login user
  As a user
  So that I can access the communication helper
  I want to be able to login

Scenario: Access the system
    Given I am on the login page
    When I fill in "Email" with "jbsmith124@citadel.edu"
    And I fill in "Password" with "password567"
    And I press "Submit"
    Then I am on the home page

# Scenario: Login as admin
# Given: I am user John B. Smith. My email address is jbsmith123@citadel.edu, 
# my password is password1234, and I have a role as an admin
# When I fill in “Email” with “jbsmith123@citadel.edu”
# When I fill in “Password” with “password1234”
# When I press “Confirm”
# Then I am on the admin page

# Scenario: Login as a student
# Given: I am user Jane B Smith. I have an email address of jbsmith124@citadel.edu, my password is password567, and I have a role as a student
# When I fill in “Email” with “jbsmith124@citadel.edu”
# When I fill in “Password” with “password567”
# When I press “Confirm”
# Then I am on the student page

# Scenario: Cannot login
# Given: I am John Doe. I do not have an email address, a password, nor do I have a role for this web application.
# When I fill in “Email” with “jdoe@citadel.edu”
# When I fill in “Password” with “password”
# When I press “Confirm”
# Then I am on the login page
