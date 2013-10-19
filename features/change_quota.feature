Feature: change quota
 
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to see my storage quota for my project

Background: quotas for the past 12 months have been added to database

  Given the following quota exist:

  And  I am on the view_quota page

Scenario: fill in valid change_quota value (happy path)
  
  Given I am on the view_quota page
  When I fill in change_quota field with valid_value
  And I press the submit button
  Then I should see "Submitted!"
  And I should not see "Invalid"
  And I should see current_month_quota changed to new_value

Scenario: fill in invalid change_quota value (sad path)
  
  Given I am on the view_quota page
  When I fill in change_quota field with invalid_value
  And I press the submit button
  Then I should see "Invalid"