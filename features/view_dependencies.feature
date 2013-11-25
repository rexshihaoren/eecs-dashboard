Feature: View dependencies
 
  As a faculty member
  So that I can understand what I'm being charged for
  I want to see who I am being billed for (which of my students and how much per student)

Background: billing info for graduate students and connections to graduate students have been added to database 

  Given the following usages exist:

  | user    | directory | date    | usage  |  max    |  
  | Bob	    | proj1     | 11.1.14 | 50     |  100    |
  | Bob	    | proj1     | 11.2.14 | 80     |  100    |
  | Bob	    | proj1     | 11.3.14 | 90     |  100    |
  | Bob	    | proj1     | 11.4.14 | 70     |  100    |
  | Bob	    | proj1     | 11.5.14 | 100    |  100    |
  | Bob	    | proj1     | 11.6.14 | 120    |  150    |
  | Bill    | proj2     | 10.1.14 | 100    |  120    |

  And aculich is being billed for Bob and Bill

  And I am on the view dependants page for aculich

Scenario: see grad students
  
  Then I should see "Bob"
  Then I should see "Bill"
  Then I should see "Bob's billing"
  Then I should see "Bob's quota"

Scenario: see students billing and quota pages
  When I follow "Bob's billing"
  #Then I should be on the view billing page for dependant Bob
  And I should see "120 GB"
  When I follow "Back to Dependants"
  #Then I should be on the view dependants page for aculich
  When I follow "Bob's quota"
  #Then I should be on the view quota page for dependant Bob
  And I should see "80.0"
  When I press "Change proj1 Quota"
  Then I fill in "quota_name" with "170"
  Then I press "Change Max Quota"
  #Then I should be on the view quota page
  And I should see "proj1 Quota was successfully changed"
