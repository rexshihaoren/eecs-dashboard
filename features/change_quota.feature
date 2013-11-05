Feature: change quota
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to change quota for my project

Background: data for proj1 has been added to the database

  Given the following directories exist:
  | id| name     | usage  | quota|
  | 1 | Home     | 5      | 10   |
  | 2 | proj1    | 6      | 10   |
  | 3 | proj2    | 1      | 10   |
  | 4 | proj3    | 8      | 10   |

  And the following usage_history exist:

  | directory| month| usage    | quota | quota_limit |
  |   proj1  | 1    | 5        | 10    | 20          |
  |   proj1  | 2    | 6        | 10    | 20          |
  |   proj1  | 3    | 1        | 10    | 20          |
  |   proj1  | 4    | 2        | 10    | 20          |
  |   proj2  | 1    | 5        | 10    | 20          |
  |   proj2  | 2    | 6        | 10    | 20          |
  |   proj3  | 3    | 1        | 10    | 20          |
  |   proj3  | 4    | 2        | 10    | 20          |

  And the current_month is 4

  And  I am on the detailed view page for proj1


Scenario: fill in valid change_quota value (happy path)
  
  When I fill in "change_quota" with "15"
  And I press "Submit"
  Then I should see "Submitted!"
  And the "quota" field within "current_month" should contain "15"


Scenario: fill in invalid change_quota value (sad path)
  
  When I fill in "change_quota" with "100000"
  And I press "Submit"
  Then I should see "Invalid Quota!"
  And the "quota" field within "current_month" should contain "10"


  
  
