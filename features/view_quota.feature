Feature: view quota
 
  As a user who uses storage services
  So that I can understand how much storage is available for me
  I want to see my storage quota for my projects (current value and some visualization of past history)

Background: quotas of different directories have been added to database

Given the following usages exist:

  | user  | directory | date     | usage  | created_at         | updated_at         |  max    |  
  | aculich | proj1     | 10.22.14 | 12000  | 2012-10-23 12:30:15| 2013-08-24 12:30:15|  100000 |
  | aculich | proj2     | 10.23.14 | 10000  | 2012-08-23 12:30:15| 2013-09-24 12:30:15|  100000 |
 
  And I am logged in as "aculich"

  And  I am on the dashboard page

Scenario: press on view_quota button
   
  When I follow "View Quota"
  #Then I should be on the view quota page for proj1
  Then I should see "12"
  When I follow 'View proj2 Quota'
  #Then I should be on the view quota page for proj2
  Then I should see "10"
