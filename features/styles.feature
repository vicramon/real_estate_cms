Feature: Styles

  Scenario: Site pulls in site-specific stylsheet
    Given there is a site with a page with blocks
    When I visit that site
    Then I should see that the custom stylesheet is loaded
