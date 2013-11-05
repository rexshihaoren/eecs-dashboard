Feature: detailed view
  As a user who uses storage services
  So that I can adjust to changes in my project
  I want to see the detailed usage history for my project

Background: data for the directories and usage history have been added to database

  Given the following directories exist:
  | id| name     | usage  | quota |
  | 1 | Home     | 5      | 100   |
  | 2 | proj1    | 6      | 100   |
  | 3 | proj2    | 1      | 100   |
  | 4 | proj3    | 8      | 100   |

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


Scenario: Press detailed view when I am on view quota page
  Given I am on the view quota page
  And I press "Detailed Information about proj1"
  Then I should be on the detailed view page for proj1


Scenario: View Detailed Usage History
  Given I am on the detailed view page for proj1
  Then I should see usage history for "proj1"


Scenario: View detailed view pafe for another directory using dropdown box
  Given I am on the detailed view page for proj1
  When I select "proj2" from "other_directories"
  Then I should be on the detailed view page for proj2
  