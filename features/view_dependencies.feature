Feature: View dependencies
 
  As a faculty member
  So that I can understand what I'm being charged for
  I want to see who I am being billed for (which of my students and how much per student)

Background: billing info for graduate students and connections to graduate students have been added to database 

  Given the billing data for several graduate students has been added

  And aculich is being billed for these students

  And I am on view dependencies page for aculich

Scenario: see grad students
  
  Then I should see "John"
  Then I should see "Bob"
  Then I should see basic billing information for "John"
  Then I should see basic billing information for "Bob"

Scenario: see students billing page
  When I follow  "View John's Billing"
  Then I should be on the view billing page for "John"
  And I should see all billing information for "John"
