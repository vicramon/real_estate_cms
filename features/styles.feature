Feature: Styles

  Scenario: Site pulls in site-specific stylsheet
    Given 1 site
    When I visit that site
    Then I should see that the custom stylesheet is loaded
