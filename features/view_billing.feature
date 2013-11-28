Feature: view billing
 
  As a user who uses storage services
  So that I can understand what I am being charged
  I want to see how much I am being charged given the amount of space I am using

Background: usage data have been added to database

  Given the following usages exist:
  | user    | directory | date     | usage| max    | rate | 
  | aculich | proj1     | 10.22.14 | 2    | 100000 | 2.1  |
  | aculich | proj2     | 10.23.14 | 2    | 100000 | 3.2  |
  | aculich | eecs-home | 11.23.14 | 3    | 100000 | 1.5  |
 

Scenario: press on view_billing button
  


  Given I am on the dashboard page
  When I follow "View Billing Information"
  Then I should be on the view billing page 
  And I should see "Current" button
  And I should see "History" button
  And I should see "TOTAL COST= $107.1"
  And I should see the following rows in the view billing table:
  | item      | $/month    | usage     |  cost |
  | CIF       | $72.00     | n/a       |  $72  |
  | ICF       | $10        | n/a       |  $10  |
  | SIF       | $10        | n/a       |  $10  |
  | proj1     | $2.1/GB    | 2 GB      |  $4.2 |
  | proj2     | $3.2/GB    | 2 GB      |  $6.4 |
  | eecs-home | $1.5/GB    | 3 GB      |  $4.5 |

