Feature: More details on main dashboard page
 
  As a faculty member
  So that I get a quick understanding of my billing and quotas
  I want to see a small summary of details regarding this on the main page

Background: billing info for graduate students and connections to graduate students have been added to database 

  Given the following usages exist:

  | user            | directory | date    | usage  |  max    | rate | 
  | aculich	    | proj1     | 11.1.14 | 50     |  100    | 0.09 |
  | Bob  	    | proj1     | 11.2.14 | 80     |  100    | 0.09 |
  | Bill	    | proj1     | 11.3.14 | 90     |  100    | 0.09 |

  And aculich is being billed for Bob and Bill

  And I am on the dashboard page

Scenario: see billing summary
  
  Then I should see "Total Billing for You = $96.5"

Scenario: see quota summary
  Then I should see "Your Total Storage = 50 GB"
  Then I should see "Your Total Quota = 100 GB"

Scenario: see dependency summary
  Then I should see "Total Billing for Your Dependents = $199.3"

