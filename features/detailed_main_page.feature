Feature: More details on main dashboard page
 
  As a faculty member
  So that I get a quick understanding of my billing and quotas
  I want to see a small summary of details regarding this on the main page

Background: billing info for graduate students and connections to graduate students have been added to database 

  Given the following usages exist:

  | user            | directory | date    | usage  |  max    | rate | 
  | aculich	    | proj1     | 11.1.14 | 50     |  100    | 0.09 |
  | aculich	    | proj1     | 11.2.14 | 80     |  100    | 0.09 |
  | aculich	    | proj1     | 11.3.14 | 90     |  100    | 0.09 |
  | aculich	    | proj1     | 11.4.14 | 70     |  100    | 0.09 |
  | aculich	    | proj1     | 11.5.14 | 100    |  100    | 0.09 |
  | aculich	    | proj1     | 11.6.14 | 120    |  150    | 0.09 |
  | aculich         | proj2     | 10.1.14 | 100    |  120    | 0.09 |

  And aculich is being billed for Bob and Bill

  And I am on the dashboard page

Scenario: see billing summary
  
  Then I should see "total storage used: 630GB"
  Then I should see "total billing: $120.00"

Scenario: see quota summary
  Then I should see "proj1"
  Then I should see "proj2"
  Then I should see "120 out of 150 GB used"
  Then I should see "100 out of 120 GB used"

Scenario: see basic dependencies
  Then I should see "Bob"
  Then I should see "Bill"
