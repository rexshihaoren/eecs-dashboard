Feature: change quota
 
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to see my storage quota for my project

Background: quotas for the past 12 months have been added to database

  Given the following month_quota exist:
  | month      | usage  | quota |
  | Jan-2013   | 5      | 10    |
  | Feb-2013   | 6      | 10    |
  | Mar-2013   | 1      | 10    |
  | Apr-2013   | 8      | 10    |
  | May-2013   | 5      | 10    |
  | Jun-2013   | 7      | 10    |
  | July-2013  | 9      | 10    |
  | Aug-2013   | 2      | 10    |
  | Sep-2013   | 5      | 10    |
  | Oct-2013   | 4      | 10    |
  | Nov-2013   | 3      | 10    |
  | Dec-2013   | 2      | 10    |

  And  I am on the view_quota page

Scenario: fill in valid change_quota value (happy path)
  
  Given I am on the view_quota page
  When I fill in change_quota field with valid_value
  And I press 'Submit'
  Then I should see "Submitted!"
  And I should not see "Invalid"
  And I should see current_month_quota changed to new_value

Scenario: fill in invalid change_quota value (sad path)
  
  Given I am on the view_quota page
  When I fill in change_quota field with invalid_value
  And I press 'Submit'
  Then I should see "Invalid"