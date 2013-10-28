Feature: See who I'm being billed for
 
  As a faculty member
  So that I can understand what I'm being charged for
  I want to see who I am being billed for (which of my students and how much per student)

Background: billing info for graduate students have been added to database

  Given the following billing info exist:

  And  I am on the accounts page

Scenario: press on view_account_detail button
  
  Given I am on the accounts page 
  When I press 'Who am I being billed for?'
  Then I should be on the who_am_i_being_billed_for page 
  And I should see billing info for all graduate stuents