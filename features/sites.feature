Feature: Sites

  Scenario: User visits a site
    Given 1 site
    When I visit that site's domain
    Then I should see that site's street address in the footer
