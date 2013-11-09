Feature: change quota
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to change quota for my project

Background: data for proj1 has been added to the database

  Given the following quota exist:
  | user     | quota    | directory  | created_at           | updated_at          |
  | user1    | 100000   | Home       | 2013-11-23 12:30:15  | 2013-12-24 12:30:15 |
  | user1    | 100000   | proj1      | 2013-11-23 12:30:15  | 2013-12-24 12:30:15 |
  | user1    | 100000   | proj2      | 2013-11-23 12:30:15  | 2013-12-24 12:30:15 |
  | user1    | 100000   | proj3      | 2013-11-23 12:30:15  | 2013-12-24 12:30:15 |

  And the following usages exist:

  | user  | directory | date     | usage  | created_at         | updated_at         |  max    |  
  | user1 | proj1     | 10.22.14 | 12000  | 2012-10-23 12:30:15| 2013-08-24 12:30:15|  100000 |
  | user2 | proj2     | 10.23.14 | 10000  | 2012-08-23 12:30:15| 2013-09-24 12:30:15|  100000 |
 


Scenario: fill in valid change_quota value (happy path)
  Given I am on the view quota page for proj1
  Then I should see "Change Quota"
  When I follow "Change proj1 Quota"
  Then I should be on the change quota page
  Then I fill in "quota_name" with "8000"
  Then I press "Change Max Quota"
  Then I should be on the view quota page
  And I should see "proj1 Quota was successfully changed"


  
  
