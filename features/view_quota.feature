Feature: view quota
 
  As a user who uses storage services
  So that I can understand how much storage is available for me
  I want to see my storage quota for my projects (current value and some visualization of past history)

Background: quotas of the past 12 months have been added to database

  Given the following quota exist:

  And  I am on the storage_directory page

Scenario: press on view_quota button
  
  Given I am on the storage_directory page 
  When I press 'View Quota'
  Then I should be on the view_quota Page 
  And I should see storage for the past 12 months
  And I should see quota for the past 12 months