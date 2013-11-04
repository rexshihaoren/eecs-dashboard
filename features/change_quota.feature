Feature: change quota
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to see my storage quota for my project

Background: quotas for the past 12 months have been added to database

  Given the test data exists

  And  I am on the change_quota page for aaron's proj1


Scenario: see the data

  Then I should see a detailed view of the quota history

Scenario: fill in valid change_quota value (happy path)
  
  When I fill in change_quota field with valid_value
  And I press 'Submit'
  Then I should see "Submitted!"
  And I should not see "Invalid"
  And I should see current_month_quota changed to new_value


Scenario: fill in invalid change_quota value (sad path)
  
  When I fill in change_quota field with invalid_value
  And I press 'Submit'
  Then I should see "Invalid"

Scenario: view different quota using dropdown box
  When I select proj2 from other_folders
  Then I should be on the change_quota page for aaron's proj2
  
  
