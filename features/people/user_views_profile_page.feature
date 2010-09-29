Feature: User views profile page
  In order to find information about a user
  As a user
  I want to 

  @javascript
  Scenario: User views his own profile page
    Given there are following users:
      | person | 
      | kassi_testperson1 |
      | kassi_testperson2 |
    And there is item offer with title "car spare parts" from "kassi_testperson1" and with share type "sell"
    And there is favor request with title "massage" from "kassi_testperson1"
    And there is rideshare offer from "Helsinki" to "Turku" by "kassi_testperson1"
    And there is housing offer with title "Housing" from "kassi_testperson2" and with share type "sell"
    And there is item request with title "bike" from "kassi_testperson1" and with share type "rent"
    And that listing is closed
    And there is favor offer with title "sewing" from "kassi_testperson1"
    And that listing is closed
    And I am logged in as "kassi_testperson1"
    When I follow "profile"
    Then I should see "car spare parts"
    And I should see "Helsinki - Turku"
    And I should not see "Housing"
    And I should not see "massage"
    And I should not see "bike"
    And I should not see "sewing"
    And I should see "Offers (2)" within ".inbox_tab_selected"
    And I should see "Requests (1)" within ".inbox_tab_unselected"
    And I follow "Requests (1)"
    Then I should not see "car spare parts"
    And I should not see "Helsinki - Turku"
    And I should not see "Housing"
    And I should see "massage"
    And I should not see "bike"
    And I should not see "sewing"
    And I should see "Offers (2)" within ".inbox_tab_unselected"
    And I should see "Requests (1)" within ".inbox_tab_selected"
    And I follow "Show also closed"
    And I should see "bike"
    And I should see "Offers (3)" within ".inbox_tab_unselected"
    And I should see "Requests (2)" within ".inbox_tab_selected"
    And I follow "Offers (3)"
    And I should see "sewing"
    And I follow "Show only open"
    And I should see "Offers (2)" within ".inbox_tab_selected"
    And I should see "Requests (1)" within ".inbox_tab_unselected"
    And I should not see "sewing"
  
  @javascript
  Scenario: User views somebody else's profile page
    Given there are following users:
      | person | 
      | kassi_testperson1 |
      | kassi_testperson2 |
    And there is item offer with title "car spare parts" from "kassi_testperson1" and with share type "sell"
    And there is favor request with title "massage" from "kassi_testperson1"
    And there is rideshare offer from "Helsinki" to "Turku" by "kassi_testperson1"
    And there is housing offer with title "Housing" from "kassi_testperson2" and with share type "sell"
    And I am not logged in
    And I am on the home page
    When I follow "car spare parts"
    And I follow "listing_author"
    Then I should see "car spare parts"
    And I should see "Helsinki - Turku"
    And I should not see "Housing"
    And I should not see "massage"
    And I should see "Offers (2)" within ".inbox_tab_selected"
    And I should see "Requests (1)" within ".inbox_tab_unselected"
  
  @javascript
  Scenario: User views a profile page with listings with visibility settings
     Given there are following users:
       | person | 
       | kassi_testperson1 |
       | kassi_testperson2 |
     And there is item offer with title "car spare parts" from "kassi_testperson1" and with share type "sell"
     And visibility of that listing is "kassi_users"
     And there is favor offer with title "massage" from "kassi_testperson1"
     And there is housing request with title "apartment" from "kassi_testperson1" and with share type "rent"
     And visibility of that listing is "disabled"
     And I am on the home page
     And I should not see "car spare parts"
     When I follow "massage"
     And I follow "listing_author"
     And I should not see "car spare parts"
     And I should see "massage"
     When I log in as "kassi_testperson1"
     And I follow "massage"
     And I follow "listing_author"
     Then I should see "car spare parts"
     And I should see "massage"
     And I should not see "apartment"
  
  
  
  
  
  