Feature: Sites

  Scenario: User visits a site
    Given there is a site with a page with blocks
    When I visit that site's domain
    Then I should see that site's street address in the footer
