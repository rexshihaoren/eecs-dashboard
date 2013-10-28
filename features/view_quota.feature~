Feature: view quota
 
  As a user who uses storage services
  So that I can understand how much storage is available for me
  I want to see my storage quota for my projects (current value and some visualization of past history)

Background: quotas of different directories have been added to database

  Given the following directories exist:
  | name     | usage  | quota |
  | Home     | 5      | 10    |
  | proj1    | 6      | 10    |
  | proj2    | 1      | 10    |
  | proj3    | 8      | 10    |

  And  I am on the dashboard page

Scenario: press on view_quota button
  
  Given I am on the dashboard page 
  When I follow 'View Quota'
  Then I should be on the view_quota page 
  And I should see all percentages_of_usage
