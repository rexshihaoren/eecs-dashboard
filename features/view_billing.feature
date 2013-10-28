Feature: view billing
 
  As a user who uses storage services
  So that I can understand what I am being charged
  I want to see how much I am being charged given the amount of space I am using

Background: billing of the past 12 months have been added to database

  Given the following billing_info exist:

  And  I am on the storage_directory page

Scenario: press on view_billing button
  
  Given I am on the storage_directory page 
  When I press "View Billing"
  Then I should be on the view billing Page 
  And I should see billing for the past 12 months
  And I should see predicted billing for the nexted 6 months
  And I should see average_daily_billing
  And I should see average_monthly_billing
  And I should see average_yearly_billing