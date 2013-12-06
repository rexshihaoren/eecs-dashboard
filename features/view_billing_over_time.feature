Feature: view billing over time

	As a user who uses storage services
	so that I can understand what I am being charged for and how that has varied over time
	I want to see a graph of the components of what I'm paying and how those components have changed over time

Background: usage data have been added to database

  Given the following usages exist:
  | user    | directory | date     | usage| max    | rate | 
  | aculich | proj1     | 10.22.14 | 2    | 100000 | 2.1  |
  | aculich | proj2     | 10.23.14 | 2    | 100000 | 3.2  |
  | aculich | eecs-home | 11.23.14 | 3    | 100000 | 1.5  |
 

Scenario: view billing page has Current and History buttons
  
  Given I am on the view billing page
  Then I should see "Current" button
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

Scenario: switch view billing page views

  Given I am on the view billing page
  And I press "History"
  Then "view_billing_chart_history" should not have trivial div
  And "view_billing_chart_current" should have trivial div
  And I press "Current"
  Then "view_billing_chart_current" should not have trivial div
  And "view_billing_chart_history" should have trivial div


