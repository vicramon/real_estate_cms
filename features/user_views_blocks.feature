Feature: User views blocks

  Scenario:
    Given there is a site with a page with blocks
    When I visit a page with blocks
    Then I should see those blocks
