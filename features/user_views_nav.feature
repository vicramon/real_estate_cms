Feature: User views nav

  Scenario: User views pages in nav and footer
    Given a site with pages
    When I visit that site
    Then I should see the pages in the nav
    And I should see the pages in the footer
